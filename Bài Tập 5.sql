DROP PROCEDURE IF EXISTS FindEmptyBed;
DROP PROCEDURE IF EXISTS EmergencyAdmission;

DELIMITER //

CREATE PROCEDURE FindEmptyBed(
    IN p_department_id INT,
    OUT p_bed_id INT
)
BEGIN

    SELECT bed_id
    INTO p_bed_id
    FROM Beds
    WHERE department_id = p_department_id
    AND status = 'Empty'
    LIMIT 1;

END //

CREATE PROCEDURE EmergencyAdmission(
    IN p_patient_id INT,
    IN p_doctor_id INT,
    IN p_exam_time DATETIME,
    IN p_department_id INT,
    OUT p_message VARCHAR(100)
)
BEGIN

    DECLARE v_bed_id INT;
    DECLARE v_count INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_message = 'Loi he thong';
    END;

    START TRANSACTION;

    SELECT COUNT(*)
    INTO v_count
    FROM Departments
    WHERE department_id = p_department_id;

    IF v_count = 0 THEN

        ROLLBACK;
        SET p_message = 'Tu choi: Khoa khong ton tai';

    ELSE

        SELECT COUNT(*)
        INTO v_count
        FROM Beds
        WHERE patient_id = p_patient_id
        AND status = 'Occupied';

        IF v_count > 0 THEN

            ROLLBACK;
            SET p_message = 'Tu choi: Benh nhan dang luu tru';

        ELSE

            CALL FindEmptyBed(p_department_id, v_bed_id);

            IF v_bed_id IS NULL THEN

                ROLLBACK;
                SET p_message = 'Tu choi: Khoa hien da het giuong';

            ELSE

                INSERT INTO Appointments(
                    patient_id,
                    doctor_id,
                    appointment_time
                )
                VALUES(
                    p_patient_id,
                    p_doctor_id,
                    p_exam_time
                );

                UPDATE Beds
                SET status = 'Occupied',
                    patient_id = p_patient_id
                WHERE bed_id = v_bed_id;

                COMMIT;

                SET p_message = 'Nhap vien thanh cong';

            END IF;

        END IF;

    END IF;

END //

DELIMITER ;

CALL EmergencyAdmission(1, 1, '2026-05-20 08:00:00', 1, @msg);
SELECT @msg;

CALL EmergencyAdmission(2, 1, '2026-05-20 09:00:00', 2, @msg);
SELECT @msg;

CALL EmergencyAdmission(1, 1, '2026-05-20 10:00:00', 1, @msg);
SELECT @msg;

CALL EmergencyAdmission(3, 1, '2026-05-20 11:00:00', 999, @msg);
SELECT @msg;
