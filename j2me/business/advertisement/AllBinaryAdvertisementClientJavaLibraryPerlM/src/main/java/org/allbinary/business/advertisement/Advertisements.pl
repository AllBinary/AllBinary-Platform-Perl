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

package org::allbinary::business::advertisement::Advertisements;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{bannerList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{pageList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{myRandomFactory} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub addPage {
    my ($self, $advertisementProcessorInterface) = @_;
        if (!$self->{pageList}->contains($advertisementProcessorInterface)) {
            $self->{pageList}->add($advertisementProcessorInterface);
        }
}


sub startRandomPage {
    my ($self) = @_;
        my $size = $self->{pageList}->size();
        if ($size > 0) {
            my $random = $self->{myRandomFactory}->getAbsoluteNextInt($size);
            my $advertisementProcessorInterface = $self->{pageList}->{objectArray}->[$random];
            $advertisementProcessorInterface->start();
        }
}


sub processRandomPage {
    my ($self) = @_;
        if ('org::allbinary::logic::system::security::licensing::LockedUtil'->getInstance()->isLocked()) {
            my $size = $self->{pageList}->size();
            if ($size > 0) {
                my $random = $self->{myRandomFactory}->getAbsoluteNextInt($size);
                my $advertisementProcessorInterface = $self->{pageList}->{objectArray}->[$random];
                $advertisementProcessorInterface->process();
            }
        }
}


sub stopAllPage {
    my ($self) = @_;
        for (my $index = $self->{pageList}->size(); --$index >= 0; ) {
            my $advertisementProcessorInterface = $self->{pageList}->{objectArray}->[$index];
            $advertisementProcessorInterface->stop();
        }
}


sub addBanner {
    my ($self, $advertisementProcessorInterface) = @_;
        if (!$self->{bannerList}->contains($advertisementProcessorInterface)) {
            $self->{bannerList}->add($advertisementProcessorInterface);
        }
}


sub startAll {
    my ($self) = @_;
        for (my $index = $self->{bannerList}->size(); --$index >= 0; ) {
            my $advertisementProcessorInterface = $self->{bannerList}->{objectArray}->[$index];
            $advertisementProcessorInterface->start();
        }
}


sub stopAllBanner {
    my ($self) = @_;
        for (my $index = $self->{bannerList}->size(); --$index >= 0; ) {
            my $advertisementProcessorInterface = $self->{bannerList}->{objectArray}->[$index];
            $advertisementProcessorInterface->stop();
        }
}


sub getBanner {
    my ($self, $index) = @_;
        my $advertisementProcessorInterface = $self->{bannerList}->{objectArray}->[$index];
        return $advertisementProcessorInterface;
}


sub stopAll {
    my ($self) = @_;
        $self->stopAllBanner();
        $self->stopAllPage();
}

use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::logic::system::security::licensing::LockedUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

