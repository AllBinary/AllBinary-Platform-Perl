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

package org::allbinary::game::score::HighScore;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
    $self->{name} = undef;
    $self->{gameInfo} = undef;
    $self->{score} = undef;
    $self->{scoreString} = undef;
}


sub new {
    my ($class, $id, $name, $gameInfo, $score) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $id;
        $self->{name} = $name;
        $self->{gameInfo} = $gameInfo;
        $self->{score} = $score;
        $self->{scoreString} = ("" . ($self->{score}));
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getScore {
    my ($self) = @_;
        return $self->{score};
}


# throws Exception
sub getAsBytes {
    my ($self) = @_;
        my $byteArrayOutputStream = 'java::io::ByteArrayOutputStream'->new();
        my $outputStream = 'java::io::DataOutputStream'->new($byteArrayOutputStream);
        $outputStream->writeUTF($self->getName());
        $outputStream->writeLong($self->getScore());
        return $byteArrayOutputStream->toByteArray();
}


sub getGameInfo {
    my ($self) = @_;
        return $self->{gameInfo};
}


sub getScoreString {
    my ($self) = @_;
        return $self->{scoreString};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->{name})->append($commonSeps->{COLON})->appendlong($self->{score})->append($commonSeps->{FORWARD_SLASH})->append($self->{scoreString})->toString();
}

# use java::io::ByteArrayOutputStream;
# use java::io::DataOutputStream;
use org::allbinary::game::GameInfo;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

