#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <unistd.h>

typedef struct {
  char appname[64];
  char desc[512 - 64];
} notif_packet;


int lastSent = 0;

void sendNotify(NSString* appname, NSString* desc) {
  if (lastSent % 2) return;
  lastSent++;
  int socketSD = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if (socketSD <= 0) {
    NSLog(@"NFME Error: Could not open socket.");
    return;
  }
  struct sockaddr_in servaddr;
  memset(&servaddr, 0, sizeof(servaddr));

  servaddr.sin_family = AF_INET;
  inet_pton(AF_INET, "172.20.21.241", &servaddr.sin_addr);
  servaddr.sin_port = htons(6666);

  notif_packet packet;
  strcpy(packet.appname, [appname  cStringUsingEncoding:[NSString defaultCStringEncoding]]);
  strcpy(packet.desc, [desc  cStringUsingEncoding:[NSString defaultCStringEncoding]]);

  int ret = sendto(socketSD, (char *)&packet, 512,
		0, (const struct sockaddr *) &servaddr,
			sizeof(servaddr));
  if (ret < 0) {
    NSLog(@"NFME Error: Could not open send notification packet.");
    close(socketSD);
    return;
  }
  close(socketSD);
}
