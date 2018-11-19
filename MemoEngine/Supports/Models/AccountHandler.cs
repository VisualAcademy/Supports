using System.Web;

namespace MemoEngine.Supports
{
    public class AccountHandler
    {
        public static bool HasGroup(string strGroudName)
        {
            // 수작업으로 관리자 권한 체크
            if (HttpContext.Current.Session["UserName"].ToString() == "admin@a.com")
            {
                return true;
            }
            return false; 
        }
    }
}
