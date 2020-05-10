﻿--xuất ra thông tin giáo viên và giáo viên quản lý chủ nhiệm của người đó
SELECT GV1.HOTEN , GV2.HOTEN FROM GIAOVIEN AS GV1 , GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV
--- xuất ra số lượng giáo viên khoa cntt
SELECT COUNT(*) FROM GIAOVIEN AS GV , KHOA AS K , BOMON AS BM
WHERE GV.MABM = BM.MABM AND BM.MAKHOA = K.MAKHOA AND K.TENKHOA = N'Công nghệ thông tin'
--XUẤT RA THÔNG TIN GIÁO VIÊN VÀ ĐỀ TÀI NGƯỜI ĐÓ THAM GIA CÓ KẾT QUẢ LÀ ĐẠT
SELECT G.* , D.TENDT FROM GIAOVIEN AS G , DETAI AS D , THAMGIADT AS T
WHERE G.MAGV = T.MAGV AND T.MADT = D.MADT AND T.KETQUA = N'Đạt'