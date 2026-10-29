# 
# To change this license header, choose License Headers in Project Properties. 
# To change this template file, choose Tools | Templates 
# and open the template in the editor.  
# Generated Code Do Not Modify

# Java interface
package org::allbinary::game::ChallengerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setWinner {
    my ($self, $isWinner) = @_;
    die "abstract method setWinner";
}


1;

