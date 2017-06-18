#library(dplyr)
#library(reshape2)
#library(ggplot2) 

#ggplot(filter(歐洲5國數據_長表,variable%in%"应届毕业生就业率",Year>2003), 
#       aes(x = Year, 
#           y = value,colour=Country),title(main ="5國应届毕业生就业率變化趨勢"))+   
#  geom_point()+geom_smooth()

cm<-group_by(ed,Country)%>%summarise(幼儿接受教育率=mean(幼儿接受教育率,na.rm=T),'年度公共教育支出(Million PPS)'=mean(`年度公共教育支出(Million PPS)`,na.rm=T),'平均对每名学生的教育支出(PPS)'=mean(`平均对每名学生的教育支出(PPS)`,na.rm=T),`本国国际学生（大学）人员流动性`=mean(`本国国际学生（大学）人员流动性`,na.rm=T),中等教育水平学生平均掌握外语数=mean(中等教育水平学生平均掌握外语数,na.rm=T),教育支出占国家年度总GDP百分比=mean(教育支出占国家年度总GDP百分百,na.rm=T),应届毕业生就业率=mean(应届毕业生就业率,na.rm=T),国民终生受教育率=mean(国民终生受教育率,na.rm=T),'20至24岁拥有高中学历人数比例'=mean(`20至24岁拥有高中学历人数比例`,na.rm=T),'30至34岁拥有大学学历人数比例'=mean(`30至34岁拥有大学学历人数比例`,na.rm=T),Immigration=mean(Immigration,na.rm=T),Emigration=mean(Emigration,na.rm=T),'Net Migration'=mean(`Net Migration`,na.rm=T),'Total Migration'=mean(`Total Migration`,na.rm=T),个人受教育后就业率=mean(个人受教育后就业率,na.rm=T),在读大学生平均年龄=mean(在读大学生平均年龄,na.rm=T),`学生出国留学（大学）人员流动性`=mean(`学生出国留学（大学）人员流动性`,na.rm=T),国小师生比率=mean(国小师生比率,na.rm=T))
cm$Country<-as.factor(cm$Country)
cm<-cm[-(14:18),]
cm<-cm[-c(23,47),]
tm<-group_by(ed,Year)%>%summarise(幼儿接受教育率=mean(幼儿接受教育率,na.rm=T),'年度公共教育支出(Million PPS)'=mean(`年度公共教育支出(Million PPS)`,na.rm=T),'平均对每名学生的教育支出(PPS)'=mean(`平均对每名学生的教育支出(PPS)`,na.rm=T),`本国国际学生（大学）人员流动性`=mean(`本国国际学生（大学）人员流动性`,na.rm=T),中等教育水平学生平均掌握外语数=mean(中等教育水平学生平均掌握外语数,na.rm=T),教育支出占国家年度总GDP百分比=mean(教育支出占国家年度总GDP百分百,na.rm=T),应届毕业生就业率=mean(应届毕业生就业率,na.rm=T),国民终生受教育率=mean(国民终生受教育率,na.rm=T),'20至24岁拥有高中学历人数比例'=mean(`20至24岁拥有高中学历人数比例`,na.rm=T),'30至34岁拥有大学学历人数比例'=mean(`30至34岁拥有大学学历人数比例`,na.rm=T),Immigration=mean(Immigration,na.rm=T),Emigration=mean(Emigration,na.rm=T),'Net Migration'=mean(`Net Migration`,na.rm=T),'Total Migration'=mean(`Total Migration`,na.rm=T),个人受教育后就业率=mean(个人受教育后就业率,na.rm=T),在读大学生平均年龄=mean(在读大学生平均年龄,na.rm=T),`学生出国留学（大学）人员流动性`=mean(`学生出国留学（大学）人员流动性`,na.rm=T),国小师生比率=mean(国小师生比率,na.rm=T))

ggplot(arrange(cm,desc(`年度公共教育支出(Million PPS)`))[1:11,], 
       aes(x = reorder(Country, desc(`年度公共教育支出(Million PPS)`)), 
           y = `年度公共教育支出(Million PPS)`,colour=Country,
           title(main ="各國平均年度公共教育支出(Million PPS)"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`年度公共教育支出(Million PPS)`), vjust = -0.5, hjust = 0.5)) 

ggplot(arrange(cm,desc(`平均对每名学生的教育支出(PPS)`))[1:10,], 
       aes(x = reorder(Country, desc(`平均对每名学生的教育支出(PPS)`)), 
           y = `平均对每名学生的教育支出(PPS)`,colour=Country,
           title(main ="各國平均一年对每名学生的教育支出(PPS)"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`平均对每名学生的教育支出(PPS)`), vjust = -0.5, hjust = 0.5))

ggplot(arrange(cm,desc(教育支出占国家年度总GDP百分比))[1:10,], 
       aes(x = reorder(Country, desc(教育支出占国家年度总GDP百分比)), 
           y = 教育支出占国家年度总GDP百分比,colour=Country)) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(教育支出占国家年度总GDP百分比,2), vjust = -0.5, hjust = 0.5))

ggplot(arrange(cm,desc(应届毕业生就业率))[2:11,], 
       aes(x = reorder(Country, desc(应届毕业生就业率)), 
           y = 应届毕业生就业率,colour=Country)) + 
  geom_bar(stat = "identity")+theme(legend.position='none')+
  geom_text(aes(label = round(应届毕业生就业率,1), vjust = -0.5, hjust = 0.5))

ggplot(arrange(cm,desc(应届毕业生就业率))[2:11,], 
       aes(x = Country, 
           y = 个人受教育后就业率,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(应届毕业生就业率)), 
                                           y = 应届毕业生就业率,colour=Country))+
  geom_text(aes(label = round(个人受教育后就业率,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(应届毕业生就业率,1),
                vjust = (个人受教育后就业率-应届毕业生就业率)/1.8))+
  ylab("个人受教育后就业率與应届毕业生就业率")

ggplot(arrange(cm,desc(国民终生受教育率))[2:10,], 
       aes(x = reorder(Country, desc(国民终生受教育率)), 
           y = 国民终生受教育率,colour=Country)) + 
  geom_bar(stat = "identity")+theme(legend.position='none')+
  geom_text(aes(label = round(国民终生受教育率,1), vjust = -0.5, hjust = 0.5))

ggplot(cm[-28,], 
       aes(x = 应届毕业生就业率, 
           y = 个人受教育后就业率,
           title(main ="应届毕业生就业率與个人受教育后就业率的關係")))+geom_point()+
  theme(legend.position='none')+geom_smooth()+
  geom_text(aes(label = Country, vjust = -0.5, hjust = 0.5))

ggplot(filter(歐洲5國數據,Year>1999,Year<2012), 
       aes(x = Year, 
           y = `平均对每名学生的教育支出(PPS)`,colour=Country,
           title(main ="5國平均对每名学生的教育支出(PPS)變化趨勢"))) + 
  geom_line()

ggplot(filter(歐洲5國數據,Year>2003), 
       aes(x = Year, 
           y = 应届毕业生就业率,colour=Country,title(main ="5國应届毕业生就业率變化趨勢"))) + 
  geom_line()

ggplot(tm[-(1:9),], 
       aes(x = 教育支出占国家年度总GDP百分比, 
           y = `年度公共教育支出(Million PPS)`,colour=Year,
           title(main ="")))+geom_point()+
  theme(legend.position='none')+
  geom_text(aes(label = Year, vjust = -0.5, hjust = 0.5))

ggplot(tm[-(1:9),], 
       aes(x = 幼儿接受教育率, 
           y = 国小师生比率,colour=Year,
           title(main ="")))+geom_point()+
  theme(legend.position='none')+geom_smooth()+
  geom_text(aes(label = Year, vjust = -0.5, hjust = 0.5))

#移民
ggplot(arrange(年均人口流動總數,desc(年均人口流動總數))[1:10,], 
       aes(x = reorder(Country, desc(年均人口流動總數)), 
           y = 年均人口流動總數,colour=Country)) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(年均人口流動總數,1), vjust = -0.5, hjust = 0.5))

ggplot(歐洲5國平均數據, 
       aes(x = reorder(Country, desc(Emigration)), 
           y = Emigration,colour=Country)) + 
  geom_bar(stat = "identity")+theme(legend.position='none')+
  geom_text(aes(label = round(Emigration,1), vjust = -0.5, hjust = 0.5))

ggplot(歐洲5國平均數據, 
       aes(x = Country, 
           y = 国小师生比率,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(幼儿接受教育率)), 
                                           y = 幼儿接受教育率,colour=Country))+
  geom_text(aes(label = round(国小师生比率,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(幼儿接受教育率,1),
                vjust = (国小师生比率-幼儿接受教育率)/2.05))+
  ylab("国小师生比率與幼儿接受教育率")

ggplot(filter(歐洲5國數據,Year>2001,Year<2014), 
       aes(x = Year, 
           y = Emigration,colour=Country,title(main ="5國遷出人數變化趨勢"))) + 
  geom_line()

ggplot(filter(歐洲5國數據,Year>2001,Year<2013), 
       aes(x = Year, 
           y = 幼儿接受教育率,colour=Country,title(main ="5國幼儿接受教育率變化趨勢"))) + 
  geom_line()

ggplot(歐洲5國平均數據, 
       aes(x = reorder(Country, desc(`年度公共教育支出(Million PPS)`)), 
           y = `年度公共教育支出(Million PPS)`,colour=Country)) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`年度公共教育支出(Million PPS)`,2), vjust = -0.5, hjust = 0.5))

ggplot(歐洲5國平均數據, 
       aes(x = reorder(Country, desc(`平均对每名学生的教育支出(PPS)`)), 
           y = `平均对每名学生的教育支出(PPS)`,colour=Country,
           title(main ="各國平均一年对每名学生的教育支出(PPS)"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`平均对每名学生的教育支出(PPS)`), vjust = -0.5, hjust = 0.5))

ggplot(filter(歐洲5國數據,Year>1999,Year<2012), 
       aes(x = Year, 
           y = `平均对每名学生的教育支出(PPS)`,colour=Country,title(main ="5國平均对每名学生的教育支出(PPS)變化趨勢"))) + 
  geom_line()

ggplot(filter(歐洲5國數據,Year>2001,Year<2014), 
       aes(x = Year, 
           y = Immigration,colour=Country,title(main ="5國遷入人數變化趨勢"))) + 
  geom_line()

ggplot(歐洲5國平均數據, 
         aes(x = Country, 
             y = `学生出国留学（大学）人员流动性`,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(`本国国际学生（大学）人员流动性`)), 
                                           y = `本国国际学生（大学）人员流动性`,colour=Country))+
  geom_text(aes(label = round(`学生出国留学（大学）人员流动性`,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(`本国国际学生（大学）人员流动性`,1),
    vjust = (`学生出国留学（大学）人员流动性`-`本国国际学生（大学）人员流动性`)/3))

#法國
ggplot(filter(歐洲5國數據,Year>2001,Year<2014), 
       aes(x = Year, 
           y = `Net Migration`,colour=Country,title(main ="5國凈移民變化趨勢"))) + 
  geom_line()

ggplot(歐洲5國平均數據, 
         aes(x = reorder(Country, desc(`Net Migration`)), 
             y = `Net Migration`,colour=Country,
             title(main ="各國年均凈移民"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`Net Migration`), vjust = -0.5, hjust = 0.5))

ggplot(歐洲5國平均數據, 
         aes(x = reorder(Country, desc(`Total Migration`)), 
             y = `Total Migration`,colour=Country,
             title(main ="各國年均遷移總人數"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`Total Migration`), vjust = -0.5, hjust = 0.5))

ggplot(歐洲5國平均數據, 
         aes(x = Country, 
             y = 国小师生比率,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(幼儿接受教育率)), 
                                           y = 幼儿接受教育率,colour=Country))+
  geom_text(aes(label = round(国小师生比率,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(幼儿接受教育率,1),
                vjust = (国小师生比率-幼儿接受教育率)/2.05))+
  ylab("国小师生比率與幼儿接受教育率")

ggplot(歐洲5國平均數據, 
         aes(x = Country, 
             y = `30至34岁拥有大学学历人数比例`,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(`20至24岁拥有高中学历人数比例`)), 
                                           y = `20至24岁拥有高中学历人数比例`,colour=Country))+
  geom_text(aes(label = round(`30至34岁拥有大学学历人数比例`,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(`20至24岁拥有高中学历人数比例`,1),
                vjust = (`30至34岁拥有大学学历人数比例`-`20至24岁拥有高中学历人数比例`)/1.7))+
  ylab("30至34岁拥有大学学历人数比例與20至24岁拥有高中学历人数比例")

ggplot(歐洲5國平均數據, 
         aes(x = reorder(Country, desc(在读大学生平均年龄)), 
             y = 在读大学生平均年龄,colour=Country,
             title(main ="各國在读大学生平均年龄"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(在读大学生平均年龄,2), vjust = -0.5, hjust = 0.5))

五國在读大学生平均年齡<-mean(歐洲5國平均數據$在读大学生平均年龄)
names(五國在读大学生平均年齡)<-"五國在读大学生平均年齡"
五國在读大学生平均年齡
歐洲國家在读大学生平均年齡<-mean(cm$在读大学生平均年龄,na.rm=T)
names(歐洲國家在读大学生平均年齡)<-"歐洲國家在读大学生平均年齡"
歐洲國家在读大学生平均年齡

ggplot(歐洲5國平均數據, 
         aes(x = reorder(Country, desc(教育支出占国家年度总GDP百分比)), 
             y = 教育支出占国家年度总GDP百分比,colour=Country,
             title(main ="五國教育支出占国家年度总GDP百分比"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(教育支出占国家年度总GDP百分比,2), vjust = -0.5, hjust = 0.5))

ggplot(歐洲5國平均數據, 
         aes(x = Country, 
             y = `学生出国留学（大学）人员流动性`,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(`本国国际学生（大学）人员流动性`)), 
                                           y = `本国国际学生（大学）人员流动性`,colour=Country))+
  geom_text(aes(label = round(`学生出国留学（大学）人员流动性`,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(`本国国际学生（大学）人员流动性`,1),
                vjust = (`学生出国留学（大学）人员流动性`-`本国国际学生（大学）人员流动性`)/3))

法國應屆畢業生年均就業率<-as.numeric(歐洲5國平均數據[1,8])
names(法國應屆畢業生年均就業率)<-"法國應屆畢業生年均就業率"
法國應屆畢業生年均就業率
歐盟應屆畢業生年均就業率<-mean(歐盟28國平均數據$应届毕业生就业率,na.rm=T)
names(歐盟應屆畢業生年均就業率)<-"歐盟應屆畢業生年均就業率"
歐盟應屆畢業生年均就業率

