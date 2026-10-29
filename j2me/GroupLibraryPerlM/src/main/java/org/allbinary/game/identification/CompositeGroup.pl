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

package org::allbinary::game::identification::CompositeGroup;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{groupInterface} = undef;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class, $groupInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{groupInterface} = $groupInterface;
    return $self;
}


sub clear {
    my ($self) = @_;
        $self->{list}->clear();
}


sub add {
    my ($self, $groupInterface) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $groupCommonFactory = 'org::allbinary::game::identification::GroupCommonFactory'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($groupCommonFactory->{ADDING_LABEL});
        $stringBuffer->append($groupInterface->toString());
        $stringBuffer->append($groupCommonFactory->{TO_LABEL});
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{groupInterface}));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{ADD});
        $self->{list}->add($groupInterface);
}


sub isInGroup {
    my ($self, $groupInterface) = @_;
        if ($self->{list}->contains($groupInterface)) {
            return 1;
        } else {
            return 0;
        }
}


sub getGroup {
    my ($self) = @_;
        return $self->{groupInterface};
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::identification::GroupCommonFactory;

1;

