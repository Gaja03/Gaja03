#include<stdio.h>
#include<string.h>
#include<math.h>
main()
{
int u,v,num,i,j,l,k,s[10],min,cost[10][10],dist[10],path[10],n;
clrscr();
printf("\n ENTER VERTECES:");
scanf("%d",&n);
printf("\n ENTER ADJECENCY MATRIX:\n");
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
scanf("%d",&cost[i][j]);
}
for(i=1;i<=n;i++)
for(j=1;j<=n;j++)
if(i==j) cost[i][j]=0;
else if(cost[i][j]==-1)
cost[i][j]=30000;
printf("\nENTER SOURCE VERTEX:");
scanf("%d",&v); clrscr();
for(i=1;i<=n;i++)
{
s[i]=0;
path[i]=v; dist[i]=cost[v][i];
}
dist[v]=0;
for(num=2;num<=n;num++)
{
min=30000; u=0;
for(i=1;i<=n;i++)
{
if(s[i]!=1) if(min>dist[i])
{
u=i; min=dist[i];
}
}
s[u]=1;
for(i=1;i<=n;i++)
{ if(s[i]!=1)
if(dist[i]>(min+cost[u][i]))
{
dist[i]=min+cost[u][i];
path[i]=u;
}
}
}
printf("\n");
printf("\nPATH MATRIX:\n");
printf("\nDISTANCE NODE PATH\n");
for(i=1;i<=n;i++)
{ printf("\n %d",dist[i]);
printf(" %d ",i);
j=i;
do
{
printf(" --> %d ",path[j]);
u=path[j];
j=u;
}while(u!=v);
}
getch ();
}