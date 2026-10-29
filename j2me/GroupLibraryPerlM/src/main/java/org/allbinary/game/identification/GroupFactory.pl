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

package org::allbinary::game::identification::GroupFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::identification::GroupFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{NULL_GROUP_ARRAY} = [(undef) x (0)];
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{index} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::identification::GroupFactory::instance;
}


sub getNextGroup {
    my ($self) = @_;
        my $group = $self->{list}->{objectArray}->[$self->{index}];
        $self->{index}++;
        return $group;
}


sub getNextGroupByName {
    my ($self, $name) = @_;
        my $group = $self->getNextGroup();
        $group->setName($name);
        return $group;
}


sub init {
    my ($self, $groups, $nameArray) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $TEAM = "Team ";
        $self->{list}->clear();
        $self->{index} = 0;
        my $size = $self->{list}->size();
        while ($size < $groups) {
            my $name = $stringUtil->{EMPTY_STRING};
            if ($size < scalar(@{$nameArray})) {
                $name = $nameArray->[$size];
            } else {
                $stringMaker->delete(0, $stringMaker->length());
                $name = $stringMaker->append($TEAM)->appendint($size)->toString();
            }
            $self->{list}->add('org::allbinary::game::identification::Group'->new($name, ((int(($size + 3)) + 32768) % 65536 - 32768)));
            $size++;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::identification::Group;

1;

