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

package org::allbinary::business::user::modules::configuration::UserConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::modules::configuration::UserConfigurationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{userEmailConfigurationInterface} = undef;
    $self->{timeCreated} = undef;
    $self->{timeLastModified} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of UserConfiguration takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userEmailConfigurationInterface} = 'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfiguration'->new();
        $self->{timeCreated} = 'org::allbinary::business::time::created::TimeCreated'->new(0);
        $self->{timeLastModified} = 'org::allbinary::business::time::modified::TimeLastModified'->new(0);
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{userEmailConfigurationInterface} = 'org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfiguration'->new($hashMap);
        $self->{timeCreated} = 'org::allbinary::business::time::created::TimeCreated'->new($hashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED}));
        $self->{timeLastModified} = 'org::allbinary::business::time::modified::TimeLastModified'->new($hashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}));
    return $self;
}


sub getUserEmailConfigurationInterface {
    my ($self) = @_;
        return $self->{userEmailConfigurationInterface};
}


sub setUserEmailConfigurationInterface {
    my ($self, $userEmailConfigurationInterface) = @_;
        $self->{userEmailConfigurationInterface} = $userEmailConfigurationInterface;
}


sub getTimeCreated {
    my ($self) = @_;
        return $self->{timeCreated};
}


sub getTimeLastModified {
    my ($self) = @_;
        return $self->{timeLastModified};
}


sub setTimeCreated {
    my ($self, $timeCreated) = @_;
        $self->{timeCreated} = $timeCreated;
}


sub setTimeLastModified {
    my ($self, $timeLastModified) = @_;
        $self->{timeLastModified} = $timeLastModified;
}

use java::util::HashMap;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::time::created::TimeCreated;
use org::allbinary::business::time::modified::TimeLastModified;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfiguration;
use org::allbinary::logic::communication::smtp::configuration::user::UserEmailConfigurationInterface;
use org::allbinary::business::user::modules::configuration::UserConfigurationInterface;

1;

