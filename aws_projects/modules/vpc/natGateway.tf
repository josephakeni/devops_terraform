# /* 
# NAT gatway will is not included in the free tier
# If you want to stay within the free tier comment or 
# avoid using NAT gatway except it is neccessary to do so.
# */
 
#  ################################
#  #   ELASTIC IP                 #
#  ################################
#  resource "aws_eip" "nat" {
#    vpc = true
#  }

#  ################################
#  #   NAT GATEWAY                #
#  ################################
#  resource "aws_nat_gateway" "nat_gw" {
#    allocation_id = "${aws_eip.nat.id}"
#    subnet_id     = "${aws_subnet.public_subnet_a.id}"
#    tags={
#        Name="nat_gw"
#    }
#  }

