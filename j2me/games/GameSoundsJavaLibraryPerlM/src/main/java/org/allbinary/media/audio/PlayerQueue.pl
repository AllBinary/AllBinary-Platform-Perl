#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::media::audio::PlayerQueue;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $TOTAL = "Sounds In Queue: ";

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{max} = undef;
}


sub new {
    my ($class, $max) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{max} = $max;
    return $self;
}


sub add {
    my ($self, $sound) = @_;
        try {
            if (!$self->{list}->contains($sound)) {
                $self->{list}->add($sound);
            }
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{ADD});
        }
}


sub process {
    my ($self) = @_;
        my $sound = 'org::allbinary::media::audio::NoSound'->getInstance();
        try {
            my $played = 0;
            if ($self->{list}->size() > 0) {
                $sound = $self->{list}->removeAt(0);
                if (defined($sound)) {
                    $sound->getPlayerP()->start();
                }
                while ($self->{list}->size() > $self->{max}) {
                    $self->{list}->removeAt(0);
                }
                $played = 1;
            }
            return $played;
        } catch ($e) {
            my $resource = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if (defined($sound)) {
                $resource = $sound->getResource();
            }
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{EXCEPTION_LABEL})->append($resource)->toString(), $self, $self->{commonStrings}->{PROCESS});
            return 0;
        }
}


sub clear {
    my ($self) = @_;
        $self->{list}->clear();
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($org::allbinary::media::audio::PlayerQueue::TOTAL)->appendint($self->{list}->size())->toString();
}

use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::media::audio::NoSound;

1;

