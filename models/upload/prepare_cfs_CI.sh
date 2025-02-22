# $1：挂载点ip $2:挂载目录
unset http_proxy && unset https_proxy 
apt-get update
apt-get install nfs-common -y
echo ---cfs_folder:$2
if [ -d $2 ];then
   rm -rf $2
fi

mkdir $2
mount -t nfs4 -o minorversion=1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport $1:/ $2
export date_path=${PWD}/$2
echo "---date_path:${date_path}---"