package ru.itis.drugstore.parsers;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import ru.itis.drugstore.models.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SakuraParser implements Parser{

    private Document doc;
    private String link = "http://sakura.ru/search/index.php?s=Y&q=";


    public List<Item> getItemsListByRequest(String request) {
        List<Item> list = new ArrayList<Item>();
        String newLink = link + request.replace(' ', '+');
        try{
            doc = Jsoup.connect(newLink).get();
        }catch (IOException e){
            throw new IllegalStateException(e);
        }

        Elements elements = doc.getElementsByClass("block_item");
        for(Element element : elements){
            String name = element.getElementsByTag("img").attr("alt");
            String price = element.getElementsByClass("price").text();
            String href = "http://sakura.ru" + element.getElementsByClass("name").get(0).attr("href");
            String img = "http://sakura.ru" + element.getElementsByTag("img").attr("src");

            Item item = new Item(name.toUpperCase(), Double.parseDouble(price.replaceAll("[\\D]", "")), href, img);
            list.add(item);
        }

        return list;
    }
}