package com.tp.mes.mvc.repository;

import com.tp.mes.mvc.model.CompanySection;
import java.util.List;

public interface CompanyRepository {

  List<String> getKeywords();

  List<CompanySection> getSections();
}
