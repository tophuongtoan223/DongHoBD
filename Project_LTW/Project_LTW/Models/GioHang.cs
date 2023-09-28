using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace Project_LTW.Models
{

    public class GioHang
    {
        LoginDataContext db = new LoginDataContext();
        public int MaDongHo { get; set; }
        public string TenDongHo { get; set; }
        public string AnhBia { get; set; }
        public double GiaBan { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien
        {
            get { return SoLuong * GiaBan; }
        }
        //Khởi tạo giỏ hàng 
        public GioHang(int mdh)
        {
            MaDongHo = mdh;
            DongHo s = db.DongHos.Single(n => n.MaDongHo == MaDongHo);
            TenDongHo = s.TenDongHo;
            AnhBia = s.AnhBia;
            GiaBan = double.Parse(s.GiaBan.ToString());
            SoLuong = 1;
        }
    }
}
