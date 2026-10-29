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

package org::allbinary::game::score::HighScores;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{orderedHighScoresList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{name} = undef;
    $self->{heading} = undef;
    $self->{columnOneHeading} = "Name";
    $self->{columnTwoHeading} = undef;
}


sub new {
    my ($class, $name, $heading, $columnTwoHeading) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{heading} = $heading;
        $self->{columnTwoHeading} = $columnTwoHeading;
    return $self;
}


sub setList {
    my ($self, $orderedHighScoresList) = @_;
        $self->{orderedHighScoresList} = $orderedHighScoresList;
}


sub getList {
    my ($self) = @_;
        return $self->{orderedHighScoresList};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getTotal {
    my ($self) = @_;
        return $self->getList()->size();
}


sub addHighScore {
    my ($self, $newHighScore) = @_;
        $self->{orderedHighScoresList}->add($newHighScore);
}


sub getHeading {
    my ($self) = @_;
        return $self->{heading};
}


sub getColumnOneHeading {
    my ($self) = @_;
        return $self->{columnOneHeading};
}


sub getColumnTwoHeading {
    my ($self) = @_;
        return $self->{columnTwoHeading};
}


# throws Exception
sub isBestScore {
    my ($self, $newHighScore) = @_;
        return 0;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("HighScores: ");
        $stringBuffer->append($self->{heading});
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::string::CommonLabels'->getInstance()->{TOTAL_LABEL});
        $stringBuffer->appendint($self->{orderedHighScoresList}->size());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::score::HighScoresInterface;

1;

