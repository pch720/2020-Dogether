package poly.persistance.redis;

import poly.dto.WordDTO;

import java.util.List;

public interface IRedisMapper {

    public boolean getExists(String key) throws Exception; // 데이터가 존재하는지 체크
    
    public List<WordDTO> getWordCount(String key) throws Exception; // 데이터 가져오기
    
    public void setWordCount(String key, List<WordDTO> sList) throws Exception; // 데이터 저장하기
    
    public boolean setTimeOutHour(String key, int hours) throws Exception; // 정보 저장될 시간(TTL) 설정
}
