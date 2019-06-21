package ru.itis.drugstore.parsers;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ZdravCityParser implements Parser{

    private Document doc;
    private String link = "https://zdravcity.ru/search/r_kazan/?order=Y&what=";


    public List<Item> getItemsListByRequest(String request){
        String newLink = link + request.replace(' ', '+');
        try{
            doc = Jsoup.connect(newLink).get();
        }catch (IOException e){
            throw new IllegalStateException(e);
        }

        List<Item> list = new ArrayList<Item>();

        Elements elements;
        try {
            elements = doc.getElementsByClass("b-issue-content__list js-search-list").get(0).getElementsByTag("li");
        } catch (IndexOutOfBoundsException e){
            return list;
        }
        for(Element element : elements){
            String name = element.attr("data-name");
            String price = element.attr("data-price");
            String href = element.getElementsByTag("a").get(0).attr("data-href");
            String img = "https://zdravcity.ru" + element.getElementsByTag("img").get(0).attr("src");

            Item item = new Item(name.toUpperCase(), price, href, img);
            list.add(item);
        }

        return list;
    }
}
