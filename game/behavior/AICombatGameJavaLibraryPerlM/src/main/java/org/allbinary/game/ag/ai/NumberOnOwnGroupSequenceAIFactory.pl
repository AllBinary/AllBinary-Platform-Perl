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

package org::allbinary::game::ag::ai::NumberOnOwnGroupSequenceAIFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $hashtable, $artificialIntelligenceInterface, $ownerLayerInterface, $gameInput) = @_;
        my $integerArray = 'org::allbinary::game::ag::ai::NumberInSameGroupSequence'->getInstance()->{NUMBER_ON_SAME_TEAM_SEQUENCE};
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        for (my $index = 0; $index < scalar(@{$integerArray}); $index++) {
            my $integerCanBeNull = $hashtable->get($integerArray->[$index]);
            if (!defined($integerCanBeNull)) {
                last;
            }
            $list->add($integerCanBeNull);
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Total AI Properties: ");
        $stringBuffer->appendint($list->size());
        $stringBuffer->append(" == Total AI: ");
        $stringBuffer->appendint(scalar(@{$artificialIntelligenceInterface}));
        $stringBuffer->append(" + 1");
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{GET_INSTANCE});
        if (scalar(@{$artificialIntelligenceInterface}) - 1 > $list->size()) {
            die ("Not enough AI properties.");
        }
        if (scalar(@{$artificialIntelligenceInterface}) - 1 < $list->size()) {
            die ("Too Many AI properties.");
        }
        my $numberOnSameTeam = [(undef) x ($list->size())];
        for (my $index = 0; $index < scalar(@{$numberOnSameTeam}); $index++) {
            $numberOnSameTeam->[$index] = $list->{objectArray}->[$index];
        }
        return 'org::allbinary::game::ag::ai::NumberOnOwnGroupSequenceAI'->new($numberOnSameTeam, $artificialIntelligenceInterface, $ownerLayerInterface, $gameInput);
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::ag::ai::NumberInSameGroupSequence;
use org::allbinary::game::ag::ai::NumberOnOwnGroupSequenceAI;

1;

