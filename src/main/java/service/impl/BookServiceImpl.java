package service.impl;

import dao.BookDao;
import dao.impl.BookDaoImpl;
import domain.Book;
import domain.Page;
import service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao = new BookDaoImpl();

    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    public void deleteBookById(Integer id) {
        bookDao.deleteBookById(id);
    }

    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    public Book queryBookById(Integer id) {
        return bookDao.queryBookById(id);
    }

    public List<Book> queryBooks() {
        return bookDao.queryBooks();
    }

    public Page<Book> page(int pageNo, int pageSize) {
        Page<Book> page = new Page<Book>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = bookDao.queryForPageTotalCount();
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        int pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        /*边界的有效检查*/
        if (pageNo < 1) {
            pageNo = 1;
        }
        if (pageNo > pageTotal) {
            pageNo = pageTotal;
        }

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求当前页数据
        List<Book> items = bookDao.queryForPageItems(begin,pageSize);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }
}
