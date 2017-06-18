#library(dplyr)
#library(reshape2)
#library(ggplot2) 

#ggplot(filter(�W��5������_�L��,variable%in%"Ӧ���ҵ����ҵ��",Year>2003), 
#       aes(x = Year, 
#           y = value,colour=Country),title(main ="5��Ӧ���ҵ����ҵ��׃��څ��"))+   
#  geom_point()+geom_smooth()

cm<-group_by(ed,Country)%>%summarise(�׶����ܽ�����=mean(�׶����ܽ�����,na.rm=T),'��ȹ�������֧��(Million PPS)'=mean(`��ȹ�������֧��(Million PPS)`,na.rm=T),'ƽ����ÿ��ѧ���Ľ���֧��(PPS)'=mean(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`,na.rm=T),`��������ѧ������ѧ����Ա������`=mean(`��������ѧ������ѧ����Ա������`,na.rm=T),�еȽ���ˮƽѧ��ƽ������������=mean(�еȽ���ˮƽѧ��ƽ������������,na.rm=T),����֧��ռ���������GDP�ٷֱ�=mean(����֧��ռ���������GDP�ٷְ�,na.rm=T),Ӧ���ҵ����ҵ��=mean(Ӧ���ҵ����ҵ��,na.rm=T),���������ܽ�����=mean(���������ܽ�����,na.rm=T),'20��24��ӵ�и���ѧ����������'=mean(`20��24��ӵ�и���ѧ����������`,na.rm=T),'30��34��ӵ�д�ѧѧ����������'=mean(`30��34��ӵ�д�ѧѧ����������`,na.rm=T),Immigration=mean(Immigration,na.rm=T),Emigration=mean(Emigration,na.rm=T),'Net Migration'=mean(`Net Migration`,na.rm=T),'Total Migration'=mean(`Total Migration`,na.rm=T),�����ܽ������ҵ��=mean(�����ܽ������ҵ��,na.rm=T),�ڶ���ѧ��ƽ������=mean(�ڶ���ѧ��ƽ������,na.rm=T),`ѧ��������ѧ����ѧ����Ա������`=mean(`ѧ��������ѧ����ѧ����Ա������`,na.rm=T),��Сʦ������=mean(��Сʦ������,na.rm=T))
cm$Country<-as.factor(cm$Country)
cm<-cm[-(14:18),]
cm<-cm[-c(23,47),]
tm<-group_by(ed,Year)%>%summarise(�׶����ܽ�����=mean(�׶����ܽ�����,na.rm=T),'��ȹ�������֧��(Million PPS)'=mean(`��ȹ�������֧��(Million PPS)`,na.rm=T),'ƽ����ÿ��ѧ���Ľ���֧��(PPS)'=mean(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`,na.rm=T),`��������ѧ������ѧ����Ա������`=mean(`��������ѧ������ѧ����Ա������`,na.rm=T),�еȽ���ˮƽѧ��ƽ������������=mean(�еȽ���ˮƽѧ��ƽ������������,na.rm=T),����֧��ռ���������GDP�ٷֱ�=mean(����֧��ռ���������GDP�ٷְ�,na.rm=T),Ӧ���ҵ����ҵ��=mean(Ӧ���ҵ����ҵ��,na.rm=T),���������ܽ�����=mean(���������ܽ�����,na.rm=T),'20��24��ӵ�и���ѧ����������'=mean(`20��24��ӵ�и���ѧ����������`,na.rm=T),'30��34��ӵ�д�ѧѧ����������'=mean(`30��34��ӵ�д�ѧѧ����������`,na.rm=T),Immigration=mean(Immigration,na.rm=T),Emigration=mean(Emigration,na.rm=T),'Net Migration'=mean(`Net Migration`,na.rm=T),'Total Migration'=mean(`Total Migration`,na.rm=T),�����ܽ������ҵ��=mean(�����ܽ������ҵ��,na.rm=T),�ڶ���ѧ��ƽ������=mean(�ڶ���ѧ��ƽ������,na.rm=T),`ѧ��������ѧ����ѧ����Ա������`=mean(`ѧ��������ѧ����ѧ����Ա������`,na.rm=T),��Сʦ������=mean(��Сʦ������,na.rm=T))

ggplot(arrange(cm,desc(`��ȹ�������֧��(Million PPS)`))[1:11,], 
       aes(x = reorder(Country, desc(`��ȹ�������֧��(Million PPS)`)), 
           y = `��ȹ�������֧��(Million PPS)`,colour=Country,
           title(main ="����ƽ����ȹ�������֧��(Million PPS)"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`��ȹ�������֧��(Million PPS)`), vjust = -0.5, hjust = 0.5)) 

ggplot(arrange(cm,desc(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`))[1:10,], 
       aes(x = reorder(Country, desc(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`)), 
           y = `ƽ����ÿ��ѧ���Ľ���֧��(PPS)`,colour=Country,
           title(main ="����ƽ��һ���ÿ��ѧ���Ľ���֧��(PPS)"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`), vjust = -0.5, hjust = 0.5))

ggplot(arrange(cm,desc(����֧��ռ���������GDP�ٷֱ�))[1:10,], 
       aes(x = reorder(Country, desc(����֧��ռ���������GDP�ٷֱ�)), 
           y = ����֧��ռ���������GDP�ٷֱ�,colour=Country)) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(����֧��ռ���������GDP�ٷֱ�,2), vjust = -0.5, hjust = 0.5))

ggplot(arrange(cm,desc(Ӧ���ҵ����ҵ��))[2:11,], 
       aes(x = reorder(Country, desc(Ӧ���ҵ����ҵ��)), 
           y = Ӧ���ҵ����ҵ��,colour=Country)) + 
  geom_bar(stat = "identity")+theme(legend.position='none')+
  geom_text(aes(label = round(Ӧ���ҵ����ҵ��,1), vjust = -0.5, hjust = 0.5))

ggplot(arrange(cm,desc(Ӧ���ҵ����ҵ��))[2:11,], 
       aes(x = Country, 
           y = �����ܽ������ҵ��,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(Ӧ���ҵ����ҵ��)), 
                                           y = Ӧ���ҵ����ҵ��,colour=Country))+
  geom_text(aes(label = round(�����ܽ������ҵ��,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(Ӧ���ҵ����ҵ��,1),
                vjust = (�����ܽ������ҵ��-Ӧ���ҵ����ҵ��)/1.8))+
  ylab("�����ܽ������ҵ���cӦ���ҵ����ҵ��")

ggplot(arrange(cm,desc(���������ܽ�����))[2:10,], 
       aes(x = reorder(Country, desc(���������ܽ�����)), 
           y = ���������ܽ�����,colour=Country)) + 
  geom_bar(stat = "identity")+theme(legend.position='none')+
  geom_text(aes(label = round(���������ܽ�����,1), vjust = -0.5, hjust = 0.5))

ggplot(cm[-28,], 
       aes(x = Ӧ���ҵ����ҵ��, 
           y = �����ܽ������ҵ��,
           title(main ="Ӧ���ҵ����ҵ���c�����ܽ������ҵ�ʵ��P�S")))+geom_point()+
  theme(legend.position='none')+geom_smooth()+
  geom_text(aes(label = Country, vjust = -0.5, hjust = 0.5))

ggplot(filter(�W��5������,Year>1999,Year<2012), 
       aes(x = Year, 
           y = `ƽ����ÿ��ѧ���Ľ���֧��(PPS)`,colour=Country,
           title(main ="5��ƽ����ÿ��ѧ���Ľ���֧��(PPS)׃��څ��"))) + 
  geom_line()

ggplot(filter(�W��5������,Year>2003), 
       aes(x = Year, 
           y = Ӧ���ҵ����ҵ��,colour=Country,title(main ="5��Ӧ���ҵ����ҵ��׃��څ��"))) + 
  geom_line()

ggplot(tm[-(1:9),], 
       aes(x = ����֧��ռ���������GDP�ٷֱ�, 
           y = `��ȹ�������֧��(Million PPS)`,colour=Year,
           title(main ="")))+geom_point()+
  theme(legend.position='none')+
  geom_text(aes(label = Year, vjust = -0.5, hjust = 0.5))

ggplot(tm[-(1:9),], 
       aes(x = �׶����ܽ�����, 
           y = ��Сʦ������,colour=Year,
           title(main ="")))+geom_point()+
  theme(legend.position='none')+geom_smooth()+
  geom_text(aes(label = Year, vjust = -0.5, hjust = 0.5))

#����
ggplot(arrange(����˿����ӿ���,desc(����˿����ӿ���))[1:10,], 
       aes(x = reorder(Country, desc(����˿����ӿ���)), 
           y = ����˿����ӿ���,colour=Country)) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(����˿����ӿ���,1), vjust = -0.5, hjust = 0.5))

ggplot(�W��5��ƽ������, 
       aes(x = reorder(Country, desc(Emigration)), 
           y = Emigration,colour=Country)) + 
  geom_bar(stat = "identity")+theme(legend.position='none')+
  geom_text(aes(label = round(Emigration,1), vjust = -0.5, hjust = 0.5))

ggplot(�W��5��ƽ������, 
       aes(x = Country, 
           y = ��Сʦ������,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(�׶����ܽ�����)), 
                                           y = �׶����ܽ�����,colour=Country))+
  geom_text(aes(label = round(��Сʦ������,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(�׶����ܽ�����,1),
                vjust = (��Сʦ������-�׶����ܽ�����)/2.05))+
  ylab("��Сʦ�������c�׶����ܽ�����")

ggplot(filter(�W��5������,Year>2001,Year<2014), 
       aes(x = Year, 
           y = Emigration,colour=Country,title(main ="5���w���˔�׃��څ��"))) + 
  geom_line()

ggplot(filter(�W��5������,Year>2001,Year<2013), 
       aes(x = Year, 
           y = �׶����ܽ�����,colour=Country,title(main ="5���׶����ܽ�����׃��څ��"))) + 
  geom_line()

ggplot(�W��5��ƽ������, 
       aes(x = reorder(Country, desc(`��ȹ�������֧��(Million PPS)`)), 
           y = `��ȹ�������֧��(Million PPS)`,colour=Country)) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`��ȹ�������֧��(Million PPS)`,2), vjust = -0.5, hjust = 0.5))

ggplot(�W��5��ƽ������, 
       aes(x = reorder(Country, desc(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`)), 
           y = `ƽ����ÿ��ѧ���Ľ���֧��(PPS)`,colour=Country,
           title(main ="����ƽ��һ���ÿ��ѧ���Ľ���֧��(PPS)"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`ƽ����ÿ��ѧ���Ľ���֧��(PPS)`), vjust = -0.5, hjust = 0.5))

ggplot(filter(�W��5������,Year>1999,Year<2012), 
       aes(x = Year, 
           y = `ƽ����ÿ��ѧ���Ľ���֧��(PPS)`,colour=Country,title(main ="5��ƽ����ÿ��ѧ���Ľ���֧��(PPS)׃��څ��"))) + 
  geom_line()

ggplot(filter(�W��5������,Year>2001,Year<2014), 
       aes(x = Year, 
           y = Immigration,colour=Country,title(main ="5���w���˔�׃��څ��"))) + 
  geom_line()

ggplot(�W��5��ƽ������, 
         aes(x = Country, 
             y = `ѧ��������ѧ����ѧ����Ա������`,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(`��������ѧ������ѧ����Ա������`)), 
                                           y = `��������ѧ������ѧ����Ա������`,colour=Country))+
  geom_text(aes(label = round(`ѧ��������ѧ����ѧ����Ա������`,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(`��������ѧ������ѧ����Ա������`,1),
    vjust = (`ѧ��������ѧ����ѧ����Ա������`-`��������ѧ������ѧ����Ա������`)/3))

#����
ggplot(filter(�W��5������,Year>2001,Year<2014), 
       aes(x = Year, 
           y = `Net Migration`,colour=Country,title(main ="5��������׃��څ��"))) + 
  geom_line()

ggplot(�W��5��ƽ������, 
         aes(x = reorder(Country, desc(`Net Migration`)), 
             y = `Net Migration`,colour=Country,
             title(main ="�������������"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`Net Migration`), vjust = -0.5, hjust = 0.5))

ggplot(�W��5��ƽ������, 
         aes(x = reorder(Country, desc(`Total Migration`)), 
             y = `Total Migration`,colour=Country,
             title(main ="��������w�ƿ��˔�"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(`Total Migration`), vjust = -0.5, hjust = 0.5))

ggplot(�W��5��ƽ������, 
         aes(x = Country, 
             y = ��Сʦ������,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(�׶����ܽ�����)), 
                                           y = �׶����ܽ�����,colour=Country))+
  geom_text(aes(label = round(��Сʦ������,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(�׶����ܽ�����,1),
                vjust = (��Сʦ������-�׶����ܽ�����)/2.05))+
  ylab("��Сʦ�������c�׶����ܽ�����")

ggplot(�W��5��ƽ������, 
         aes(x = Country, 
             y = `30��34��ӵ�д�ѧѧ����������`,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(`20��24��ӵ�и���ѧ����������`)), 
                                           y = `20��24��ӵ�и���ѧ����������`,colour=Country))+
  geom_text(aes(label = round(`30��34��ӵ�д�ѧѧ����������`,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(`20��24��ӵ�и���ѧ����������`,1),
                vjust = (`30��34��ӵ�д�ѧѧ����������`-`20��24��ӵ�и���ѧ����������`)/1.7))+
  ylab("30��34��ӵ�д�ѧѧ�����������c20��24��ӵ�и���ѧ����������")

ggplot(�W��5��ƽ������, 
         aes(x = reorder(Country, desc(�ڶ���ѧ��ƽ������)), 
             y = �ڶ���ѧ��ƽ������,colour=Country,
             title(main ="�����ڶ���ѧ��ƽ������"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(�ڶ���ѧ��ƽ������,2), vjust = -0.5, hjust = 0.5))

����ڶ���ѧ��ƽ�����g<-mean(�W��5��ƽ������$�ڶ���ѧ��ƽ������)
names(����ڶ���ѧ��ƽ�����g)<-"����ڶ���ѧ��ƽ�����g"
����ڶ���ѧ��ƽ�����g
�W�އ����ڶ���ѧ��ƽ�����g<-mean(cm$�ڶ���ѧ��ƽ������,na.rm=T)
names(�W�އ����ڶ���ѧ��ƽ�����g)<-"�W�އ����ڶ���ѧ��ƽ�����g"
�W�އ����ڶ���ѧ��ƽ�����g

ggplot(�W��5��ƽ������, 
         aes(x = reorder(Country, desc(����֧��ռ���������GDP�ٷֱ�)), 
             y = ����֧��ռ���������GDP�ٷֱ�,colour=Country,
             title(main ="�������֧��ռ���������GDP�ٷֱ�"))) + 
  geom_bar(stat = "identity")+
  geom_text(aes(label = round(����֧��ռ���������GDP�ٷֱ�,2), vjust = -0.5, hjust = 0.5))

ggplot(�W��5��ƽ������, 
         aes(x = Country, 
             y = `ѧ��������ѧ����ѧ����Ա������`,colour=Country)) + 
  geom_bar(stat = "identity",mapping = aes(x = reorder(Country, desc(`��������ѧ������ѧ����Ա������`)), 
                                           y = `��������ѧ������ѧ����Ա������`,colour=Country))+
  geom_text(aes(label = round(`ѧ��������ѧ����ѧ����Ա������`,1)))+theme(legend.position='none')+
  geom_text(aes(label = round(`��������ѧ������ѧ����Ա������`,1),
                vjust = (`ѧ��������ѧ����ѧ����Ա������`-`��������ѧ������ѧ����Ա������`)/3))

�������î��I������͘I��<-as.numeric(�W��5��ƽ������[1,8])
names(�������î��I������͘I��)<-"�������î��I������͘I��"
�������î��I������͘I��
�W�ˑ��î��I������͘I��<-mean(�W��28��ƽ������$Ӧ���ҵ����ҵ��,na.rm=T)
names(�W�ˑ��î��I������͘I��)<-"�W�ˑ��î��I������͘I��"
�W�ˑ��î��I������͘I��
