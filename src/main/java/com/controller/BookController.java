package com.controller;
import com.pojo.Book;
import com.service.BookService;
import com.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
@Controller
@RequestMapping("/book")
public class BookController {
    {System.out.println("到此一游");}

    @Autowired
    private BookService bookService;

    int i=0;
    public String msg(int j){
        String msg=null;
        if(j==0){
            msg="失败";
        }else if(j>0){
            msg="成功";
        }
        return msg;
    }
    public Book getBook(MultipartFile file,HttpServletRequest request,String k){
        Book book=new Book();
        if(k!="add"){
            String bookId=request.getParameter("bookId").trim();
            if(bookId !=""){
                book.setBookId(Integer.parseInt(bookId));
            }
        }

        String bookName=request.getParameter("bookName").trim();
        String bookAuthor=request.getParameter("bookAuthor").trim();
        String bookPublishedInformation=request.getParameter("bookPublishedInformation").trim();
        String bookCount=request.getParameter("bookCount").trim();
        String bookTag=request.getParameter("bookTag").trim();
        String bookPrice=request.getParameter("bookPrice").trim();
        if(k =="select"){
            String bookBorrowingNumber=request.getParameter("bookBorrowingNumber").trim();
            String bookStar = request.getParameter("bookStar").trim();
            String bookCommentNumber = request.getParameter("bookCommentNumber").trim();
            if(bookCommentNumber !=""){
                book.setBookCommentNumber(Integer.parseInt(bookCommentNumber));
            }

            if(bookBorrowingNumber !=""){
                book.setBookBorrowingNumber(Integer.parseInt(bookBorrowingNumber));
            }
            if(bookStar !=""){
                book.setBookStar(Double.parseDouble(bookStar));
            }
        }

        if(k !="select") {

            String bookDescription=request.getParameter("bookDescription").trim();

            book.setBookDescription(bookDescription);


        }


            //String bookImage=request.getParameter("bookImage").trim();
            book.setBookImage(upload(file,request));




        book.setBookName(bookName);
        book.setBookAuthor(bookAuthor);
        book.setBookPublishedInformation(bookPublishedInformation);
        if(bookCount !=""){
            book.setBookCount(Integer.parseInt(bookCount));
        }
        if(bookTag !=""){
            book.setBookTag(Integer.parseInt(bookTag));
        }
       if(bookPrice !=""){
           book.setBookPrice(Double.parseDouble(bookPrice));
       }


        return book;
    }


    @RequestMapping("/add")
    public ModelAndView bookAdd(MultipartFile file,HttpServletRequest request){

        i=bookService.addBook(getBook(file,request,"add"));
        return list(file,request);
    }

    @RequestMapping("/delete")
    public ModelAndView bookDelete(MultipartFile file,HttpServletRequest request){
        String bookId=request.getParameter("bookId");
        i=bookService.deleteBook(Integer.parseInt(bookId));
        return list(file,request);
    }

    /**
     * 修改
     * @param
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView bookUpdate(MultipartFile file,HttpServletRequest request){

        i=bookService.updateBook(getBook(file,request,"update"));
        return list(file,request);
    }


    @ResponseBody
    @RequestMapping("/selectBook")
    public ModelAndView list(MultipartFile file,HttpServletRequest request){
        ModelAndView mav = new ModelAndView();

        List<Book> list2;
        int pageSize = 2;		//每页大小
        int currentPage =1;    //当前页
        int totalNum=0;   //总条数
        String cp = request.getParameter("cp");
        String tab=request.getParameter("tab");


        currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<Book> pu;
        if(tab ==null) {
            totalNum=bookService.countAll();
            pu= new PageUtils<Book>(currentPage, pageSize, totalNum);
            list2 = bookService.queryAll((pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());

        }else{
             totalNum=bookService.countByCondition(getBook(file,request,"select"));
            pu= new PageUtils<Book>(currentPage, pageSize, totalNum);
            list2 = bookService.queryByCondition(getBook(file,request,"select"), (pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        }
        pu.setList(list2);

        mav.setViewName("jsp/book");
        mav.addObject("pu", pu);
        mav.addObject("msg",msg(i));
        return mav;
    }

    /**
     * 文件上传
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value="/upload",method= RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam(value="file",required=false)MultipartFile file, HttpServletRequest request){
        String basePath = "demo01/src/main/webapp/images/upload/";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());

        // uploads文件夹位置
        String rootPath = request.getSession().getServletContext().getRealPath(basePath);
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH)+1));

        // 新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        // 判断目标文件所在目录是否存在
        if( !newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        System.out.println(newFile);
        // 将内存中的数据写入磁盘
        try {
            file.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 完整的url
        String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1) + "/" + newFileName;
        return  fileUrl;

}




    @RequestMapping("/selectBookForBorrow")
    public  @ResponseBody PageUtils<Book> selectBookForBorrow(HttpServletRequest request,Integer currPage,String bookName) throws Exception{
        List<Book> list2;
        int pageSize = 4;		//每页大小
        int totalNum=0;   //总条数
           PageUtils<Book> pu;
        if(currPage==0){
            currPage=1;
        }
        if(bookName ==null||"".equals(bookName)) {
            System.out.println(currPage);
            totalNum=bookService.countAll();
            pu= new PageUtils<Book>(currPage, pageSize, totalNum);
            list2 = bookService.queryAll((pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        }else{
            Book book=new Book();
            System.out.println(currPage);
             bookName =new String(bookName.getBytes("ISO-8859-1"),"utf-8");
            System.out.println(bookName);
            book.setBookName(bookName);
            totalNum=bookService.countByCondition(book);
            pu= new PageUtils<Book>(currPage, pageSize, totalNum);
            list2 = bookService.queryByCondition(book, (pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        }
        pu.setList(list2);
        request.getSession().setAttribute("pu",pu);
        request.getSession().setAttribute("msg",msg(i));
            return  pu;
    }
//    /**
//     * 文件下载
//     */
//    @RequestMapping("/down")
//    @ResponseBody
//    public void down(HttpServletRequest request, HttpServletResponse response) throws Exception{
//    //模拟文件，myfile.txt为需要下载的文件  
//    String fileName = request.getSession().getServletContext().getRealPath("upload")+"/myfile.txt";
//    //获取输入流  
//    InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
//    //假如以中文名下载的话  
//    String filename = "下载文件.txt";
//    //转码，免得文件名中文乱码  
//    filename = URLEncoder.encode(filename,"UTF-8");
//    //设置文件下载头  
//    response.addHeader("Content-Disposition", "attachment;filename=" + filename);
//    //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
//    response.setContentType("multipart/form-data");
//    BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
//    int len = 0;
//    while((len = bis.read()) != -1){
//        out.write(len);
//        out.flush();
//    }
//    out.close();
//    }



}
