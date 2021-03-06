function [AP,CP,PP,TP,authorlist,paperlist] = DataExtractionAft () 

termpaper = load ('.\DBLP_prediction\0712\TP.txt') ;
authorpaper = load ('.\DBLP_prediction\0712\AP.txt') ;
paperconf = load ('.\DBLP_prediction\0712\PC.txt') ;
paperpaper = load ('.\DBLP_prediction\0712\PP.txt') ;

termnum = max(termpaper(:,1)) +1 ;
papernum = max(authorpaper(:,2)) +1; 
authornum = max(authorpaper(:,1)) +1; 
confnum = max(paperconf(:,1)) +1 ;

AP = zeros(authornum,papernum) ;
CP = zeros(confnum,papernum) ;
PP = zeros(papernum,papernum) ;
TP = zeros(termnum,papernum) ;

%transform link matrix to the adjacent matrix
authorpapercount = size(authorpaper,1) ;
for la=1:authorpapercount
    AP(authorpaper(la,1)+1,authorpaper(la,2)+1)=1;
end

termpapercount = size(termpaper,1) ;
for la=1:termpapercount
    TP(termpaper(la,1)+1,termpaper(la,2)+1)=1;
end

paperconfcount = size(paperconf,1) ;
for la=1:paperconfcount
    CP(paperconf(la,1)+1,paperconf(la,2)+1)=1;
end

paperpapercount = size(paperpaper,1) ;
for la=1:paperpapercount
    PP(paperpaper(la,1)+1,paperpaper(la,2)+1)=1;
end

% extract author list, paper list, term list

authorlist = load ('C:\Users\v-cheluo\Desktop\Heterogeneous Network\recommendation paper\code\HetRecom\DBLP_prediction\0712\authorlist.txt') ;
paperlist = load ('C:\Users\v-cheluo\Desktop\Heterogeneous Network\recommendation paper\code\HetRecom\DBLP_prediction\0712\paperlist_test.txt') ;

end
