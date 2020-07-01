package poly.persistance.redis.impl;

import org.apache.log4j.Logger;
//import org.apache.tools.ant.Project;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Component;
import poly.dto.WordDTO;
import poly.persistance.redis.IRedisMapper;

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Component("RedisMapper")
public class RedisMapper implements IRedisMapper {

    private static RedisTemplate<Object, Object> redisDB;

    private Logger log = Logger.getLogger(this.getClass());
    /*데이터유무 확인*/
    @Override
    public boolean getExists(String key) throws Exception {

        log.info(this.getClass().getName() + " : getExists 호출");

        return redisDB.hasKey(key);
    }
    /*데이터가져오기*/
    @Override
    public List<WordDTO> getWordCount(String key) throws Exception {

        log.info(this.getClass().getName() + " : getWordCount 호출");

        List<WordDTO> rList = null;

        redisDB.setKeySerializer(new StringRedisSerializer());
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(WordDTO.class));

        if(redisDB.hasKey(key)){
            rList = (List) redisDB.opsForList().range(key, 0, -1);
        }

        log.info(this.getClass().getName() + " : getWordCount 종료");

        return rList;
    }
    /*데이터올리기*/
    @Override
    public void setWordCount(String key, List<WordDTO> sList) throws Exception {

        int res = 0;

        log.info(this.getClass().getName() + " : setWordCount 호출");

        redisDB.setKeySerializer(new StringRedisSerializer());
        redisDB.setValueSerializer(new Jackson2JsonRedisSerializer<>(WordDTO.class));

        Iterator<WordDTO> it = sList.iterator();

        while (it.hasNext()) {
            WordDTO wDTO = (WordDTO) it.next();

            redisDB.opsForList().rightPush(key, wDTO);

            wDTO = null;
        }

        res = 1;

        log.info(this.getClass().getName() + " : setWordCount 종료");

    }

    @Override
    public boolean setTimeOutHour(String roomKey, int hours) throws Exception {
        log.info(this.getClass().getName() + " : setTimeOutHour 호출");
        return redisDB.expire(roomKey, hours, TimeUnit.HOURS);
    }
}
