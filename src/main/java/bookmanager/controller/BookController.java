package bookmanager.controller;

import bookmanager.model.Book;
import bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired(required = true)
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(Model model){
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", this.bookService.getNewPage(0));

        return "books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        if(book.getId() == 0){
            this.bookService.addBook(book);
        }else {
            this.bookService.updateBook(book);
        }

        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("/read/{id}")
    public String readBook(@PathVariable("id") int id, Model model) {

        this.bookService.readBook(id);

        return "redirect:/books";
    }

    @RequestMapping("/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model){
        Book exBook = this.bookService.getBookById(id);
        exBook.setReadAlready(false);
        model.addAttribute("book", exBook);

        return "books";
    }

    @RequestMapping(value = "/search")
    public String searchBook(@RequestParam("search") String value, Model model) {

        List<Book> list = this.bookService.searchBook(value.toLowerCase());
        model.addAttribute("listBooks", list);

        return "results";
    }

    @RequestMapping(value = "/next/")
    public String nextPage(Model model) {
        List<Book> list = this.bookService.getNewPage(1);
        model.addAttribute("listBooks", list);

        return "redirect:/books";
    }

    @RequestMapping(value = "/prev/")
    public String previousPage(Model model) {
        List<Book> list = this.bookService.getNewPage(-1);
        model.addAttribute("listBooks", list);

        return "redirect:/books";
    }

}
