using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;

namespace Project_LTW.Models
{
    public class DongHoController : Controller
    {
        // GET: DongHo
        LoginDataContext db = new LoginDataContext();
        public class DongHo
        {
            // tạo một class DongHoGomCacThuocTinh
            // 1. MaDongHo: gom 4 chữ số
            // 2. Ten đồng hồ : 
            // 3. giá bán : 50000.00000VND
            // 4. Ngày sản xuất : Ngày/Thang/Nam
            // 5. Ngày Nhập Kho : Ngày Tháng/ Năm
            // 5. Hãng đồng hồ : Rolex, Hublot...

            public string MaDongHo { get; set; }
            public string TenDongHo { get; set; }
            public double GiaBan { get; set; }
            public DateTime NgaySanXuat { get; set; }
            public DateTime NgayNhapKho { get; set; }
            public string HangSanXuat { get; set; }
            public List<DongHo> Tao5DongHo()
            {
                List<DongHo> danhsachdongho = new List<DongHo>();

                danhsachdongho.Add(new DongHo()
                {
                    MaDongHo = "RL10",
                    TenDongHo = "RoLex10Vin",
                    GiaBan = 180000000,
                    NgaySanXuat = new DateTime(2022, 11, 11),
                    HangSanXuat = "Rolex",
                });
                danhsachdongho.Add(new DongHo()
                {
                    MaDongHo = "HB110",
                    TenDongHo = "HubLot10Vine",
                    GiaBan = 1880000000,
                    NgaySanXuat = new DateTime(2022, 11, 11),
                    HangSanXuat = "Hublot",
                });
                danhsachdongho.Add(new DongHo()
                {
                    MaDongHo = "RL11",
                    TenDongHo = "RoLex12VI",
                    GiaBan = 18000000000,
                    NgaySanXuat = new DateTime(2022, 11, 11),
                    HangSanXuat = "Rolex",
                });
                danhsachdongho.Add(new DongHo()
                {
                    MaDongHo = "HB12222",
                    TenDongHo = "HubLot110Vin",
                    GiaBan = 1800022220000,
                    NgaySanXuat = new DateTime(2022, 11, 11),
                    HangSanXuat = "HubLot",
                });
                danhsachdongho.Add(new DongHo()
                {
                    MaDongHo = "Casio",
                    TenDongHo = "Casio110classcic",
                    GiaBan = 180000000,
                    NgaySanXuat = new DateTime(2022, 11, 11),
                    HangSanXuat = "Casio",
                });
                return danhsachdongho;
            }
        }
    }
}