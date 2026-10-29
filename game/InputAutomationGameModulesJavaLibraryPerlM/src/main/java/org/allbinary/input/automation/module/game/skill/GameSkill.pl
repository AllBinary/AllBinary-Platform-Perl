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

package org::allbinary::input::automation::module::game::skill::GameSkill;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();

sub _init_fields {
    my ($self) = @_;
    $self->{gameSkillType} = undef;
    $self->{extra} = undef;
    $self->{time} = 0;
    $self->{vector} = undef;
    $self->{GAME_SKILL_LABEL} = "GameSkill: ";
    $self->{EXTRA_LABEL} = "Extra: ";
    $self->{TIME_LABEL} = "Time: ";
}


sub new {
    my ($class, $gameSkillType, $extra, $time) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setGameSkillType($gameSkillType);
        $self->setExtra($extra);
        $self->setTime($time);
        $self->{vector} = 'org::allbinary::util::BasicArrayListD'->new();
        $org::allbinary::input::automation::module::game::skill::GameSkill::hashMap->put('org::allbinary::logic::string::StringMaker'->new()->append($self->getGameSkillType()->getName())->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($extra)->toString(), $self);
    return $self;
}


sub getGameSkillType {
    my ($self) = @_;
        return $self->{gameSkillType};
}


sub setGameSkillType {
    my ($self, $gameSkillType) = @_;
        $self->{gameSkillType} = $gameSkillType;
}


sub getExtra {
    my ($self) = @_;
        return $self->{extra};
}


sub setExtra {
    my ($self, $extra) = @_;
        $self->{extra} = $extra;
}


sub getTime {
    my ($self) = @_;
        return $self->{time};
}


sub setTime {
    my ($self, $time) = @_;
        $self->{time} = $time;
}


sub addProperty {
    my ($self, $gameSkillPropertyInterface) = @_;
        $self->{vector}->add($gameSkillPropertyInterface);
}


sub getProperties {
    my ($self) = @_;
        return $self->{vector};
}


sub getInstance {
    my ($class, $gameSkillType, $extra) = @_;
        return $org::allbinary::input::automation::module::game::skill::GameSkill::hashMap->get('org::allbinary::logic::string::StringMaker'->new()->append($gameSkillType->getName())->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($extra)->toString());
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{GAME_SKILL_LABEL});
        $stringBuffer->append($self->getGameSkillType()->toString());
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($self->{EXTRA_LABEL});
        $stringBuffer->append($self->getExtra());
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($self->{TIME_LABEL});
        $stringBuffer->appendlong($self->getTime());
        return $stringBuffer->toString();
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

