package bookmanager.service;

import bookmanager.dao.BookDao;
import bookmanager.model.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    private int currentPage = 1;
    private final int maxPageSize = 10;


    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public void readBook(int id) {
        Book book = getBookById(id);
        book.setReadAlready(true);
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }

    @Override
    @Transactional
    public List<Book> searchBook(String value) {

        List<Book> list = listBooks();
        List<Book> newList = new ArrayList<Book>();
        for(Book book : list) {
            if(book.getAuthor().toLowerCase().contains(value) || book.getTitle().toLowerCase().contains(value)) {
                newList.add(book);
            }
        }
        return newList;
    }

    @Override
    @Transactional
    public List<Book> getNewPage(int value) {

        List<Book> list = listBooks();
        List<Book> showList = new ArrayList<Book>();

        if(list.isEmpty()) {
            return showList;
        }

        int pages = (list.size()-1)/maxPageSize + 1;

        if(value == 1 && currentPage < pages) {
            currentPage++;
        } else if (value == -1 && currentPage > 1) {
            currentPage--;
        }

        int limit = currentPage==pages ? list.size() : currentPage*10;
        for(int i = currentPage*10-10; i < limit; i++) {
            showList.add(list.get(i));
        }

        return showList;
    }
}
