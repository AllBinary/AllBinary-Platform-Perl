# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot 
#   
# Generated Code Do Not Modify

package org::allbinary::media::audio::PlayerStateUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::audio::PlayerStateUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{UNREALIZED} = "UNREALIZED";
    $self->{REALIZED} = "REALIZED";
    $self->{PREFETCHED} = "PREFETCHED";
    $self->{STARTED} = "STARTED";
    $self->{CLOSED} = "CLOSED";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::audio::PlayerStateUtil::instance;
}


sub convert {
    my ($self, $state) = @_;
        if ($state == $javax::microedition::media::Player::UNREALIZED) {
            return $self->{UNREALIZED};
        } elsif ($state == $javax::microedition::media::Player::REALIZED) {
            return $self->{REALIZED};
        } elsif ($state == $javax::microedition::media::Player::PREFETCHED) {
            return $self->{PREFETCHED};
        } elsif ($state == $javax::microedition::media::Player::STARTED) {
            return $self->{STARTED};
        } elsif ($state == $javax::microedition::media::Player::CLOSED) {
            return $self->{CLOSED};
        }
        return $self->{commonStrings}->{UNKNOWN};
}

# use javax::microedition::media::Player;
use org::allbinary::string::CommonStrings;

1;

