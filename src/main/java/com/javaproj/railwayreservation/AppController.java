package com.javaproj.railwayreservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AppController {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private BookingRepository bookingRepo;

    @GetMapping("")
    public String viewStartPage() {
        return "index";
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());

        return "registration";
    }

    @PostMapping("/process_register")
    public String processRegister(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        userRepo.save(user);

        return "register_success";
    }

    @GetMapping("/users")
    public String listUsers(Model model) {
        List<User> listUsers = userRepo.findAll();
        model.addAttribute("listUsers", listUsers);

        return "users";
    }

    @GetMapping("/home")
    public String home(Model model) {
        return "home";
    }

    @GetMapping("/book")
    public String book(Model model) {
        model.addAttribute("booking", new Booking());
        return "book";
    }

    @GetMapping("/bookings")
    public String listBookings(Model model) {
        Iterable<Booking> listBookings = bookingRepo.findAll();
        model.addAttribute("listBookings", listBookings);

        return "bookings";
    }

    @PostMapping("/process_booking")
    public String processBooking(Booking booking) {

        System.out.println(booking.getID());
        bookingRepo.save(booking);

        return "booking_success";
    }
}