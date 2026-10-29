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

package org::allbinary::game::identification::Group;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::identification::GroupInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{teamId} = undef;
    $self->{string} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $teamName, $teamId) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{teamId} = $teamId;
        $self->setName($teamName);
    return $self;
}


sub getGroupName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
        my $groupCommonFactory = 'org::allbinary::game::identification::GroupCommonFactory'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($groupCommonFactory->{GROUP_NAME_LABEL});
        $stringBuffer->append($self->{name});
        $stringBuffer->append($groupCommonFactory->{ID_LABEL});
        $stringBuffer->appendshort($self->{teamId});
        $self->{string} = $stringBuffer->toString();
}


sub getGroupId {
    my ($self) = @_;
        return $self->{teamId};
}


sub toString {
    my ($self) = @_;
        return $self->{string};
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::identification::GroupInterface;
use org::allbinary::game::identification::GroupCommonFactory;

1;

