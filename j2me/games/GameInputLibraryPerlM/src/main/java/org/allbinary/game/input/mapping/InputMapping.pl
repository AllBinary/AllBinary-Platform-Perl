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

package org::allbinary::game::input::mapping::InputMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{mappedList} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getTotalMapped {
    my ($self) = @_;
        return $self->{hashtable}->size();
}


sub isDefaultNew {
    my ($self) = @_;
        return 0;
}


sub getDefault {
    my ($self) = @_;
        return 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->getNullInstance();
}


sub removeAll {
    my ($self) = @_;
        $self->{hashtable}->clear();
        $self->{mappedList}->clear();
}


sub remove {
    my ($self, $input, $mappedToInput) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL});
        $stringBuffer->append($stringUtil->toString($input));
        $stringBuffer->append(" == ");
        $stringBuffer->append($stringUtil->toString($mappedToInput));
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "InputMapping::remove");
        my $list = $self->getMappedInput($input);
        if ($list->contains($mappedToInput)) {
            $list->remove($mappedToInput);
            $self->{mappedList}->remove($mappedToInput);
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("Removed: ");
            $stringBuffer->append($stringUtil->toString($input));
            $stringBuffer->append(" == ");
            $stringBuffer->append($stringUtil->toString($mappedToInput));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "InputMapping::remove");
        } else {
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("Not Deleted: ");
            $stringBuffer->append($stringUtil->toString($input));
            $stringBuffer->append(" == ");
            $stringBuffer->append($stringUtil->toString($mappedToInput));
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "InputMapping::remove");
        }
}


# throws Exception
sub addMapping {
    my ($self, $inputToGameKeyMapping) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub add {
    my ($self, $input, $mappedToInput) = @_;
        my $list = $self->getMappedInput($input);
        if (!$list->contains($mappedToInput)) {
            $list->add($mappedToInput);
            $self->{mappedList}->add($mappedToInput);
        }
}


sub isMapped {
    my ($self, $input) = @_;
        return $self->{mappedList}->contains($input);
}


sub getMappedInput {
    my ($self, $id) = @_;
        my $mappingInputCanBeNullList = $self->{hashtable}->get($id);
        if (!defined($mappingInputCanBeNullList)) {
            my $list = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{hashtable}->put($id, $list);
            return $list;
        }
        return $mappingInputCanBeNullList;
}


sub getHashtable {
    my ($self) = @_;
        return $self->{hashtable};
}

use org::allbinary::game::input::Input;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;

1;

