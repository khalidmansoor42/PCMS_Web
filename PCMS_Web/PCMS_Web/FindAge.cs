using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PCMS_Web
{
    public class FindAge
    {
        public string calculateAge(DateTime birthDate)
        {

            //   DateTime birthDate = Convert.ToDateTime(birthDate1);
            /* DateTime now = DateTime.Today;
             float age = now.Year - birthDate.Year;
             if (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day)) age--;

             if (age == 0)
             {
                 age = now.Month - birthDate.Month;
                 if (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day)) age--;

                 if (age == 0)
                 {
                     age = now.Day - birthDate.Day;
                     if (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day)) age--;
                     return age.ToString() + " Days";
                 }
                 else
                 {
                     return age.ToString() + " Month";
                 }
             }*/
            float Days = (DateTime.Now.Year * 365 + DateTime.Now.DayOfYear) - (birthDate.Year * 365 + birthDate.DayOfYear);
            float Years = Days / 365;
            string message = (Days >= 365) ? string.Format("{0:0.#}", Years) + " years" : string.Format("{0:0.#}", Days) + " days";
            return message;
        }
    }
}