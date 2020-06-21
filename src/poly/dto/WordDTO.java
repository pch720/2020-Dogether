package poly.dto;

public class WordDTO {
    private String Word;
    private String WordCount;
    private String r_contents;

    public String getR_contents() {
        return r_contents;
    }

    public void setR_contents(String r_contents) {
        this.r_contents = r_contents;
    }

    public String getWord() {
        return Word;
    }

    public void setWord(String word) {
        Word = word;
    }

    public String getWordCount() {
        return WordCount;
    }

    public void setWordCount(String wordCount) {
        WordCount = wordCount;
    }
}