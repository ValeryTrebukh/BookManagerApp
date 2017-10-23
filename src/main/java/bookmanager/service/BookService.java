package bookmanager.service;

import bookmanager.model.Book;

import java.util.List;

public interface BookService {
    void addBook(Book book);

    void updateBook(Book book);

    void readBook(int id);

    void removeBook(int id);

    Book getBookById(int id);

    List<Book> listBooks();

    List<Book> searchBook(String searchName);

    List<Book> getNewPage(int value);

}
