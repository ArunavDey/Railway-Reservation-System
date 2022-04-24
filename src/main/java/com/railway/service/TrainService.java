package com.railway.service;

import java.util.List;
import com.railway.entities.Train;

public interface TrainService {
	void createTrain(Train train);

	List<Train> getAllTrains();

	Train getByTrainNo(String trainNo);

	void deleteTrain(String id);

	void updateTrain(Train train);

	List<Train> getBySourceAndDestination(String source, String destination);

	Train getByTrainName(String name);
}
