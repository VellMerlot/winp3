package es.limolike.winp3RS.service;

import java.util.List;

import org.springframework.stereotype.Service;

import es.limolike.winp3.common.AppException;
import es.limolike.winp3RS.domain.Configuration;

@Service
public interface IConfigurationService {

	public List<Configuration> list() throws AppException;
}
