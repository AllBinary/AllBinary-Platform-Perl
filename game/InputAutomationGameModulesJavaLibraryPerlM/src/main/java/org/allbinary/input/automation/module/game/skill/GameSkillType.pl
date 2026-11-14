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

package org::allbinary::input::automation::module::game::skill::GameSkillType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $MANA, 'java::lang::LazyStatic', sub { 'org::allbinary::input::automation::module::game::skill::GameSkillType'->new("Mana") };
tie our $REPLENISH, 'java::lang::LazyStatic', sub { 'org::allbinary::input::automation::module::game::skill::GameSkillType'->new("Replenish") };
tie our $TIMED, 'java::lang::LazyStatic', sub { 'org::allbinary::input::automation::module::game::skill::GameSkillType'->new("Timed") };
tie our $ATTACK, 'java::lang::LazyStatic', sub { 'org::allbinary::input::automation::module::game::skill::GameSkillType'->new("Attack") };
tie our $TRANSPORT, 'java::lang::LazyStatic', sub { 'org::allbinary::input::automation::module::game::skill::GameSkillType'->new("Transport") };

sub _init_fields {
    my ($self) = @_;
    $self->{SPELL_GAME_SKILL_TYPE} = "SpellGameSkillType: ";
    $self->{name} = undef;
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->setName($name);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub toString {
    my ($self) = @_;
        return $self->{SPELL_GAME_SKILL_TYPE} . $self->getName();
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

