package com.controller;


import com.pojo.Book;
import com.pojo.BookType;
import com.service.BookService;
import com.service.BookTypeService;
import com.service.CommentService;
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
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/book")
public class BookController {
    {
        System.out.println("到此一游");
    }

    @Autowired
    private BookService bookService;
    @Autowired
    CommentService commentService;
    @Autowired
    private BookTypeService bookTypeService;
    String msg = null;

    /**
     * 发送操作成功或失败消息
     * @param j
     * @return
     */
    public String msg(int j) {

        if (j == 0) {
            msg = "失败";
        } else if (j > 0) {
            msg = "成功";
        }
        return msg;
    }

    /**
     * 从前台获取book对象的总方法
     * @param file
     * @param request
     * @param k
     * @param session
     * @return
     */
    public Book getBook(MultipartFile file, HttpServletRequest request, String k, HttpSession session) {
        Book book = new Book();
        if (k != "add") {
            String bookId = request.getParameter("bookId").trim();
            if (bookId != "") {
                book.setBookId(Integer.parseInt(bookId));
            }

        }
        if (k == "add") {
            book.setBookTag(Integer.parseInt(request.getParameter("bookTag").trim()));
        }

        String bookName = request.getParameter("bookName").trim();
        String bookAuthor = request.getParameter("bookAuthor").trim();
        String bookPublishedInformation = request.getParameter("bookPublishedInformation").trim();
        String bookCount = request.getParameter("bookCount").trim();
        String bookPrice = request.getParameter("bookPrice").trim();
        if (k == "select") {
            String bookBorrowingNumber = request.getParameter("bookBorrowingNumber").trim();
            String bookStar = request.getParameter("bookStar").trim();
            String bookCommentNumber = request.getParameter("bookCommentNumber").trim();
            if (bookCommentNumber != "") {
                book.setBookCommentNumber(Integer.parseInt(bookCommentNumber));
            }

            if (bookBorrowingNumber != "") {
                book.setBookBorrowingNumber(Integer.parseInt(bookBorrowingNumber));
            }
            if (bookStar != "") {
                book.setBookStar(Double.parseDouble(bookStar));
            }
        }

        if (k != "select") {

            String bookDescription = request.getParameter("bookDescription").trim();
            if (upload(file, request) != null && !upload(file, request).equals("")) {
                book.setBookImage(upload(file, request));
            }

            book.setBookDescription(bookDescription);


        }

        book.setBookName(bookName);
        book.setBookAuthor(bookAuthor);
        book.setBookPublishedInformation(bookPublishedInformation);
        if (bookCount != "") {
            book.setBookCount(Integer.parseInt(bookCount));
        }

        if (bookPrice != "") {
            book.setBookPrice(Double.parseDouble(bookPrice));
        }

        session.setAttribute("book1", book);
        return book;
    }


    /**
     * 添加图书
     * @param file
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/addBook")
    public ModelAndView bookAdd(MultipartFile file, HttpServletRequest request, HttpSession session) {

        Book book = getBook(file, request, "add", session);
        book.setBookBorrowingNumber(0);
        book.setBookCommentNumber(0);
        msg(bookService.addBook(book));
        Book book1 = new Book();
        book1.setBookAuthor(book.getBookAuthor());
        book1.setBookName(book.getBookName());

        List<Book> list0 = bookService.queryByCondition(book1, 0, 1);
        int bookId = list0.get(0).getBookId();
        int secondTypeId = Integer.parseInt(request.getParameter("city_c"));
        BookType bookType = new BookType(bookId, secondTypeId);
        bookTypeService.insert(bookType);
        return list(file, request, session);
    }


    /**
     * 逻辑删除(上下架)
     * @param file
     * @param request
     * @param session
     * @return
     */
    @RequestMapping("/deleteBook")
    public ModelAndView bookDelete(MultipartFile file, HttpServletRequest request, HttpSession session) {

        Book book = new Book();
        String[] bookId = request.getParameter("bookId").split(",");
        if (bookId.length > 0) {
            for (int i = 0; i < bookId.length; i++) {

                int bookTag = bookService.queryById(Integer.parseInt(bookId[i])).getBookTag();
                book.setBookTag(bookTag);
                book.setBookId(Integer.parseInt(bookId[i]));
                if (bookTag == 1) {
                    book.setBookTag(2);
                } else if (bookTag == 2) {
                    book.setBookTag(1);
                }

                msg(bookService.updateBook(book));
            }
            return list(file, request, session);
        }
        return null;
    }

    /**
     * 修改
     *
     * @param
     * @return
     */
    @RequestMapping("/updateBook")
    public ModelAndView bookUpdate(MultipartFile file, HttpServletRequest request, HttpSession session) {


        msg(bookService.updateBook(getBook(file, request, "update", session)));

        return list(file, request, session);
    }

    /**
     * 传递相关信息到用户相关界面(前台)
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectBookToUser")
    public ModelAndView listToUser(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        String cp = request.getParameter("cp");
        int currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<Book> pu;
        List<Book> list2 = new ArrayList<Book>();
        /**
         * 获取标记tab,以执行不同查询方法
         */
        String tab = request.getParameter("tab");
        System.out.println(tab);
        Book book1 = new Book();
        book1.setBookTag(1);
        /**
         * 查询热门/新/多评书籍
         */
        List<Book> hotBook1=bookService.queryHotBook(10);
        List<Book> hotBook2=bookService.queryHotBook(6);
        List<Book> newBook=bookService.queryNewBook();
        List<Book> multipleBook=bookService.queryMultiple();
        System.out.println("tab="+tab);
        if (tab == null) {


        } else if (tab.equals("3")) {
            System.out.println("tab 3="+tab);
            if (request.getParameter("bookName") != null) {
                book1.setBookName(request.getParameter("bookName"));
            }
            if(request.getParameter("authorName") !=null){
                book1.setBookAuthor(request.getParameter("authorName"));
            }
            int totalNum = bookService.countByCondition(book1);
            pu = new PageUtils<Book>(currentPage, 12, totalNum);
            list2 = bookService.queryByCondition(book1, (pu.getCurrentPage() - 1) * pu.getPageSize(), pu.getPageSize());
            pu.setList(list2);

            mav.setViewName("jsp/user_index_newWorld");
            mav.addObject("hotBook",hotBook1);
            mav.addObject("pu", pu);
            return mav;


        } else if (tab.equals("2")||tab.equals("4")) {
            int secondTypeId = Integer.parseInt(request.getParameter("typeId"));
            System.out.println("typeId=" + secondTypeId);
            List<Integer> list0;
            /**
             * 根据二级分类查图书
             */
            if(tab.equals("2")){
                list0 = bookTypeService.selectBookByType(secondTypeId);
            }
            /**
             * 根据一级分类查图书
             */
            else{
                list0 = bookTypeService.selectSecondByType(secondTypeId);
            }

            System.out.println(list0);
            if (list0 != null && list0.size() != 0  ) {
                for (Integer list : list0) {
                    if (bookService.queryById(list).getBookTag() == 1) {
                        list2.add(bookService.queryById(list));
                    }
                }
            }
            pu = new PageUtils<Book>(currentPage, 12, 0);
            pu.setList(list2);

            mav.setViewName("jsp/user_index_newWorld");
            mav.addObject("pu", pu);
            return mav;

        } else {
            System.out.println(tab);
            return null;
        }
        int totalNum = bookService.countByCondition(book1);
        pu = new PageUtils<Book>(currentPage, 12, totalNum);
        list2 = bookService.queryByCondition(book1, (pu.getCurrentPage() - 1) * pu.getPageSize(), pu.getPageSize());
        pu.setList(list2);

        mav.setViewName("jsp/user_index");
        mav.addObject("newBook",newBook);
        mav.addObject("mBook",multipleBook);
        mav.addObject("hotBook1",hotBook1);
        mav.addObject("hotBook2",hotBook2);
        mav.addObject("pu", pu);
        return mav;
    }


    /**
     * 查询图书(后台管理员界面)
     * @param file
     * @param request
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectBook")
    public ModelAndView list(MultipartFile file, HttpServletRequest request, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        List<Book> list2;
        int pageSize = 5;        //每页大小
        int currentPage = 1;    //当前页
        int totalNum = 0;   //总条数
        String cp = request.getParameter("cp");
        String tab = request.getParameter("tab");
        Book book1 = new Book();

        currentPage = cp != null ? Integer.parseInt(cp) : 1;
        PageUtils<Book> pu;
        if (tab == null) {

            book1 = (Book) request.getSession().getAttribute("book1");

        } else {
            book1 = getBook(file, request, "select", session);

        }
        totalNum = bookService.countByCondition(book1);
        pu = new PageUtils<Book>(currentPage, pageSize, totalNum);
        list2 = bookService.queryByCondition(book1, (pu.getCurrentPage() - 1) * pu.getPageSize(), pu.getPageSize());
        pu.setList(list2);

        mav.setViewName("jsp/book");
        mav.addObject("pu", pu);
        mav.addObject("msg", msg);
        msg = null;
        return mav;
    }

    /**
     * 文件上传
     *其中注释代码为防止图片未加载入服务器...
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
        String basePath = "D:\\图书管理系统\\demo01\\src\\main\\webapp\\images\\upload";
        //String basePath2="D:\\图书管理系统\\demo01\\target\\demo01\\images\\upload";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());


        /**
         * 前台form表单:method="post" enctype="multipart/form-data"
         */
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH) + 1));

        // 新文件
        File newFile = new File(basePath + File.separator + dateDirs + File.separator + newFileName);
        //File newFile2 = new File(basePath2 + File.separator + dateDirs + File.separator + newFileName);
        // 判断目标文件所在目录是否存在
        if (!newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
//        if (!newFile2.getParentFile().exists()) {
//            // 如果目标文件所在的目录不存在，则创建父目录
//            newFile2.getParentFile().mkdirs();
//        }
        System.out.println(newFile);
        // 将内存中的数据写入磁盘
        try {
            file.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
//        try {
//            file.transferTo(newFile2);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        // 完整的url
        String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH) + 1) + "/" + newFileName;
        return fileUrl;

    }


    @RequestMapping("/selectBookForBorrow")
    public @ResponseBody
    PageUtils<Book> selectBookForBorrow(HttpServletRequest request, Integer currPage, String bookName) throws Exception {
        List<Book> list2;
        int pageSize = 4;        //每页大小
        int totalNum = 0;   //总条数
        PageUtils<Book> pu;
        if (currPage == 0) {
            currPage = 1;
        }
        if (bookName == null || "".equals(bookName)) {
            System.out.println(currPage);
            totalNum = bookService.countAll();
            pu = new PageUtils<Book>(currPage, pageSize, totalNum);
            list2 = bookService.queryAll((pu.getCurrentPage() - 1) * pu.getPageSize(), pu.getPageSize());
        } else {
            Book book = new Book();
            System.out.println(currPage);
            bookName = new String(bookName.getBytes("ISO-8859-1"), "utf-8");
            System.out.println(bookName);
            book.setBookName(bookName);
            totalNum = bookService.countByCondition(book);
            pu = new PageUtils<Book>(currPage, pageSize, totalNum);
            list2 = bookService.queryByCondition(book, (pu.getCurrentPage() - 1) * pu.getPageSize(), pu.getPageSize());
        }
        pu.setList(list2);
        request.getSession().setAttribute("pu", pu);

        return pu;
    }


}
