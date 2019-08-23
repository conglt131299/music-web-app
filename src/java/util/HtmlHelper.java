/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author Cong Le
 */
public class HtmlHelper {
    public static String hyperlink(String text)
    {
        return "<li class=\"page-item\" ><p class=\"page-link\">"+text+"</p></li>";
    }
    
    public static String label(String text)
    {
        return "<li class=\"page-item active\"><p class=\"page-link\">"+text+"</p></li>";
    }
    
    
    public static String pager(int pageindex, int gap,int totalpage)
    {
        String result = "";
        if(pageindex - gap > 1)
            result+= hyperlink("First");
        for (int i = gap; i > 0; i--) {
            int page = (pageindex -i);
            if(page>0)
            result+= hyperlink(page+"");
        }
        
        result+= label(""+pageindex);
        
        for (int i = 1; i <= gap; i++) {
            int page = (pageindex+i);
            if(page<=totalpage)
            result+= hyperlink(page+"");
        }
        
        if(pageindex+gap < totalpage)
            result+= hyperlink("Last");
        
        return result;
    }
}
