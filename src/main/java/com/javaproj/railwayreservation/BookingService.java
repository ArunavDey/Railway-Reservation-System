package com.javaproj.railwayreservation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepo;

    public List<Booking> getAllBookings() {

        var it = bookingRepo.findAll();
        var bookings = new ArrayList<Booking>();
        it.forEach(e -> bookings.add(e));

        return bookings;
    }

    public Long CountBookings() {
        return bookingRepo.count();
    }

}
