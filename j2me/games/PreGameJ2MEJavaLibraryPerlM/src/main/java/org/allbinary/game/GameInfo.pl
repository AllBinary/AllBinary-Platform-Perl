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

package org::allbinary::game::GameInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NONE = 'org::allbinary::game::GameInfo'->new('org::allbinary::game::GameTypeFactory'->getInstance()->{NONE}, $org::allbinary::game::GameMode::NONE, 'org::allbinary::game::PlayerTypesFactory'->getInstance()->{PLAYER_TYPE_ONE}, -1, -1);
our $LEVEL_NAME = "LEVEL";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameInfoData} = 'org::allbinary::game::GameInfoData'->getInstance();
    $self->{gameType} = undef;
    $self->{gameMode} = undef;
    $self->{playerType} = undef;
    $self->{highestLevel} = 0;
    $self->{currentLevel} = undef;
    $self->{NEW_LEVEL} = "New Level: ";
    $self->{SET_CURRENT_LEVEL} = "setCurrentLevel";
    $self->{NEXT_GAME_LEVEL} = "nextGameLevel";
}


sub new {
    my ($class, $gameType, $gameMode, $playerType, $highestLevel, $currentLevel) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{gameType} = $gameType;
        $self->{gameMode} = $gameMode;
        $self->setHighestLevel($highestLevel);
        $self->{currentLevel} = $currentLevel;
        $self->{playerType} = $playerType;
    return $self;
}


sub getGameType {
    my ($self) = @_;
        return $self->{gameType};
}


sub getGameMode {
    my ($self) = @_;
        return $self->{gameMode};
}


sub getPlayerType {
    my ($self) = @_;
        return $self->{playerType};
}


sub getHighestLevel {
    my ($self) = @_;
        return $self->{highestLevel};
}


sub setHighestLevel {
    my ($self, $highestLevel) = @_;
        $self->{highestLevel} = $highestLevel;
}


sub getCurrentLevel {
    my ($self) = @_;
        return $self->{currentLevel};
}


sub setCurrentLevel {
    my ($self, $currentLevel) = @_;
        $self->{currentLevel} = $currentLevel;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{NEW_LEVEL})->appendint($self->getCurrentLevel())->toString(), $self, $self->{SET_CURRENT_LEVEL});
}


sub nextGameLevel {
    my ($self) = @_;
        if ($self->getCurrentLevel() < $self->getHighestLevel()) {
            $self->{currentLevel}++;
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{NEXT})->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->append($self->{NEW_LEVEL})->appendint($self->getCurrentLevel())->toString(), $self, $self->{NEXT_GAME_LEVEL});
}


sub previousGameLevel {
    my ($self) = @_;
        if ($self->getCurrentLevel() > 1) {
            $self->{currentLevel}--;
        }
}


sub isLastLevel {
    my ($self) = @_;
        if ($self->getCurrentLevel() >= $self->getHighestLevel()) {
            return 1;
        } else {
            return 0;
        }
}


sub toHashtable {
    my ($self) = @_;
        my $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        $hashtable->put($self->{gameInfoData}->{GAME_TYPE}, $self->getGameType()->toString());
        $hashtable->put($self->{gameInfoData}->{GAME_MODE}, $self->{gameMode}->toString());
        $hashtable->put($self->{gameInfoData}->{PLAYER_TYPE}, $self->{playerType}->toString());
        $hashtable->put($self->{gameInfoData}->{HIGHEST_LEVEL}, ("" . ($self->getHighestLevel())));
        $hashtable->put($self->{gameInfoData}->{CURRENT_LEVEL}, ("" . ($self->{currentLevel})));
        return $hashtable;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $stringBuffer->append($self->{gameInfoData}->{GAME_TYPE});
        $stringBuffer->append($commonSeps->{EQUALS});
        $stringBuffer->append($self->getGameType()->toString());
        $stringBuffer->append($commonSeps->{COMMA_SEP});
        $stringBuffer->append($self->{gameInfoData}->{GAME_MODE});
        $stringBuffer->append($commonSeps->{EQUALS});
        $stringBuffer->append($self->{gameMode}->toString());
        $stringBuffer->append($commonSeps->{COMMA_SEP});
        $stringBuffer->append($self->{gameInfoData}->{PLAYER_TYPE});
        $stringBuffer->append($commonSeps->{EQUALS});
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{playerType}));
        $stringBuffer->append($commonSeps->{COMMA_SEP});
        $stringBuffer->append($self->{gameInfoData}->{HIGHEST_LEVEL});
        $stringBuffer->append($commonSeps->{EQUALS});
        $stringBuffer->appendint($self->getHighestLevel());
        $stringBuffer->append($commonSeps->{COMMA_SEP});
        $stringBuffer->append($self->{gameInfoData}->{CURRENT_LEVEL});
        $stringBuffer->append($commonSeps->{EQUALS});
        $stringBuffer->appendint($self->{currentLevel});
        return $stringBuffer->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::StdUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::GameTypeFactory;
use org::allbinary::game::GameMode;
use org::allbinary::game::PlayerTypesFactory;
use org::allbinary::game::GameInfoData;

1;

