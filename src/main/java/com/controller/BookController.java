package com.controller;



import com.pojo.Book;
import com.pojo.BookType;
import com.service.BookService;
import com.service.BookTypeService;
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
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/book")
public class BookController {
    {System.out.println("到此一游");}

    @Autowired
    private BookService bookService;
    @Autowired
    private BookTypeService bookTypeService;
    String msg=null;

    public String msg(int j){

        if(j==0){
            msg="失败";
        }else if(j>0){
            msg="成功";
        }
        return msg;
    }
    public Book getBook(MultipartFile file,HttpServletRequest request,String k,HttpSession session){
        Book book=new Book();
        if(k!="add"){
            String bookId=request.getParameter("bookId").trim();
            if(bookId !=""){
                book.setBookId(Integer.parseInt(bookId));
            }

        }
        if(k=="add"){
            book.setBookImage(upload(file,request));
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

       session.setAttribute("book1",book);
        return book;
    }


    @RequestMapping("/addBook")
    public ModelAndView bookAdd(MultipartFile file,HttpServletRequest request,HttpSession session){

        Book book=getBook(file,request,"add",session);
        msg(bookService.addBook(book));
        Book book1=new Book();
        book1.setBookAuthor(book.getBookAuthor());
        book1.setBookName(book.getBookName());
        List<Book> list0=bookService.queryByCondition(book1,0,1);
        int bookId=list0.get(0).getBookId();
        int secondTypeId =Integer.parseInt(request.getParameter("city_c"));
        BookType bookType=new BookType(bookId,secondTypeId);
        bookTypeService.insert(bookType);
        return list(file,request,session);
    }



    @RequestMapping("/deleteBook")
    public ModelAndView bookDelete(MultipartFile file,HttpServletRequest request,HttpSession session){

        Book book=new Book();
        String[] bookId=request.getParameter("bookId").split(",");
        if(bookId.length>0){
            for(int i=0;i<bookId.length;i++){

                int bookTag=bookService.queryById(Integer.parseInt(bookId[i])).getBookTag();
                book.setBookTag(bookTag);
                book.setBookId(Integer.parseInt(bookId[i]));
                if(bookTag==1){
                    book.setBookTag(2);
                }else if(bookTag==2){
                    book.setBookTag(1);
                }

                msg(bookService.updateBook(book));
            }
            return list(file,request,session);
        }
        return  null;
    }

    /**
     * 修改
     * @param
     * @return
     */
    @RequestMapping("/updateBook")
    public ModelAndView bookUpdate(MultipartFile file,HttpServletRequest request ,HttpSession session){


        msg(bookService.updateBook(getBook(file,request,"update",session)));
        return list(file,request,session);
    }

    @ResponseBody
    @RequestMapping("/selectBookToUser")
    public ModelAndView listToUser(MultipartFile file,HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        String cp = request.getParameter("cp");
        int currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<Book> pu;
        List<Book> list2;
        String tab=request.getParameter("tab");
        if(tab ==null) {
            int totalNum=bookService.countAll();
            pu= new PageUtils<Book>(currentPage, 20, totalNum);
            list2 = bookService.queryAll((pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        }else{
            Book book1=new Book();
            book1.setBookName(request.getParameter("bookName"));
            int totalNum=bookService.countByCondition(book1);
            pu= new PageUtils<Book>(currentPage, 20, totalNum);
            list2 = bookService.queryByCondition(book1, (pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        }
        pu.setList(list2);

        mav.setViewName("user_index");
        mav.addObject("pu", pu);
        return mav;
    }


    @ResponseBody
    @RequestMapping("/selectBook")
    public ModelAndView list(MultipartFile file,HttpServletRequest request,HttpSession session){
        ModelAndView mav = new ModelAndView();

        List<Book> list2;
        int pageSize = 5;		//每页大小
        int currentPage =1;    //当前页
        int totalNum=0;   //总条数
        String cp = request.getParameter("cp");
        String tab=request.getParameter("tab");
        Book book1=new Book();

        currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<Book> pu;
        if(tab ==null) {

            book1=(Book) request.getSession().getAttribute("book1");

        }else{
            book1=getBook(file,request,"select",session);

        }
        totalNum=bookService.countByCondition(book1);
        pu= new PageUtils<Book>(currentPage, pageSize, totalNum);
        list2 = bookService.queryByCondition(book1, (pu.getCurrentPage()-1)  * pu.getPageSize(), pu.getPageSize());
        pu.setList(list2);

        mav.setViewName("jsp/book");
        mav.addObject("pu", pu);
       mav.addObject("msg",msg);
       msg=null;
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
        String basePath = "D:\\图书管理系统\\demo01\\src\\main\\webapp\\images\\upload";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());


        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH)+1));

        // 新文件
        File newFile = new File(basePath + File.separator + dateDirs + File.separator + newFileName);
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



}
