package ru.itis.drugstore.parsers;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import ru.itis.drugstore.models.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class RiglaParser implements Parser {

    Document doc;
    String link = "http://kazan.rigla.ru/search/?q=";

    public List<Item> getItemsListByRequest(String request) {
        List<Item> list = new ArrayList<Item>();

        try{
            String newLink = link + request.replace(' ', '+');
            doc = Jsoup.connect(newLink).get();
        }catch (IOException e){
            throw new IllegalStateException(e);
        }

        Elements elements = doc.getElementsByClass("product-wrapper product");
        for(Element element : elements){
            String name = element.getElementsByTag("img").get(0).attr("alt");
            String price = element.getElementsByClass("price").text();
            String href = "http://kazan.rigla.ru" + element.getElementsByTag("a").get(0).attr("href");
            String img = "http://kazan.rigla.ru" + element.getElementsByTag("img").attr("src");
            price = price.replaceAll(" ","").replaceAll("р","").replace(',','.');
            if(price.isEmpty()){
                price = "0";
            }

            Item item = new Item(name.toUpperCase(), Double.parseDouble(price), href, img);
            list.add(item);
        }

        return list;
    }
}
