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

package org::allbinary::game::score::RecordStoreHighScores;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScores';

our $hashTable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{platformRecordIdUtil} = 'org::allbinary::persistance::PlatformRecordIdUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{RECORD_ID} = "_HS";
    $self->{MAXHIGHSCORES} = 100;
    $self->{gameInfo} = undef;
    $self->{abeClientInformation} = undef;
    $self->{recordComparatorInterface} = undef;
}


sub new {
    my ($class, $abeClientInformation, $gameInfo, $name, $heading, $columnTwoHeading, $recordComparatorInterface) = @_;
    my $self = $class->SUPER::new($name, $heading, $columnTwoHeading);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
        $self->{gameInfo} = $gameInfo;
        $self->{recordComparatorInterface} = $recordComparatorInterface;
        $self->load();
    return $self;
}


sub getInstance {
    my ($class, $abeClientInformation, $gameInfo, $highScoreName, $heading, $columnTwoHeading, $recordComparatorInterface) = @_;
        my $highScoresCanBeNull = $org::allbinary::game::score::RecordStoreHighScores::hashTable->get($highScoreName);
        if (!defined($highScoresCanBeNull)) {
            my $highScores = 'org::allbinary::game::score::RecordStoreHighScores'->new($abeClientInformation, $gameInfo, $highScoreName, $heading, $columnTwoHeading, $recordComparatorInterface);
            $org::allbinary::game::score::RecordStoreHighScores::hashTable->put($highScores->getName(), $highScores);
            return $highScores;
        }
        return $highScoresCanBeNull;
}


sub getRecordId {
    my ($self, $abeClientInformation) = @_;
        return $self->{platformRecordIdUtil}->getRecordId($abeClientInformation, 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->append($self->getName())->append($self->{RECORD_ID})->toString());
}


sub addHighScore {
    my ($self, $newHighScore) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Adding HighScore: ")->appendlong(int($newHighScore->getScore()))->toString(), $self, $self->{commonStrings}->{ADD});
            if ($self->isTooManyHighScores()) {
                $self->{logUtil}->putF("Removing Lowest Score", $self, $self->{commonStrings}->{ADD});
                $self->removeLowestHighScore();
            }
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($self->{abeClientInformation}), 1);
            my $highScoreBytes = $newHighScore->getAsBytes();
            my $recordId = $recordStore->addRecord($highScoreBytes, 0, scalar(@{$highScoreBytes}));
            $self->load();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{ADD}, $e);
        } finally {
            try {
                if (defined($recordStore)) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("Closing RecordStore", $self, $self->{commonStrings}->{ADD});
                    $recordStore->closeRecordStore();
                }
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{ADD}, $e);
            }
        }
}


sub removeLowestHighScore {
    my ($self) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($self->{abeClientInformation}), 1);
            my $recordEnum = $recordStore->enumerateRecords($org::allbinary::game::configuration::persistance::NullRecordFilter::NULL_RECORD_FILTER, $org::allbinary::game::configuration::persistance::NullRecordComparator::NULL_RECORD_COMPARATOR, 1);
            my $scoreComparator = ($self->{recordComparatorInterface});
            my $bestHighScore = 'org::allbinary::game::score::HighScore'->new(-1, "none", $org::allbinary::game::GameInfo::NONE, $scoreComparator->getBestScore());
            my $recordAsBytes = undef;
            my $byteArrayInputStream = undef;
            my $inputStream = undef;
            while ($recordEnum->hasNextElement()) {
                my $id = $recordEnum->nextRecordId();
                $recordAsBytes = $self->{tsUtil}->getRecord($recordStore, $id);
                if (defined($recordAsBytes)) {
                    $byteArrayInputStream = 'java::io::ByteArrayInputStream'->new($recordAsBytes);
                    $inputStream = 'java::io::DataInputStream'->new($byteArrayInputStream);
                    my $name = $inputStream->readUTF();
                    my $nextScore = $inputStream->readLong();
                    my $nextCurrentHighScore = 'org::allbinary::game::score::HighScore'->new($id, $name, $org::allbinary::game::GameInfo::NONE, $nextScore);
                    if ($self->{recordComparatorInterface}->compare($nextCurrentHighScore->getAsBytes(), $bestHighScore->getAsBytes()) == $javax::microedition::rms::RecordComparator::FOLLOWS) {
                        $bestHighScore = $nextCurrentHighScore;
                    }
                }
            }
            if ($bestHighScore->getId() != -1) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Removing Lowest HighScore: ")->appendlong(int($bestHighScore->getScore()))->toString(), $self, $self->{commonStrings}->{LOAD});
                $recordStore->deleteRecord($bestHighScore->getId());
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "removeLowestHighScore", $e);
        } finally {
            try {
                if (defined($recordStore)) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("Closing RecordStore", $self, "removeLowestHighScore");
                    $recordStore->closeRecordStore();
                }
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "removeLowestHighScore", $e);
            }
        }
}


sub load {
    my ($self) = @_;
        my $recordStore = $org::allbinary::game::configuration::persistance::NullRecordStore::NULL_RECORD_STORE;
        try {
            $recordStore = 'javax::microedition::rms::RecordStore'->openRecordStore($self->getRecordId($self->{abeClientInformation}), 1);
            $self->setList('org::allbinary::util::BasicArrayListD'->new());
            my $recordEnum = $recordStore->enumerateRecords($org::allbinary::game::configuration::persistance::NullRecordFilter::NULL_RECORD_FILTER, $org::allbinary::game::configuration::persistance::NullRecordComparator::NULL_RECORD_COMPARATOR, 1);
            my $recordAsBytes = undef;
            my $byteArrayInputStream = undef;
            my $inputStream = undef;
            while ($recordEnum->hasNextElement()) {
                my $id = $recordEnum->nextRecordId();
                $recordAsBytes = $self->{tsUtil}->getRecord($recordStore, $id);
                if (defined($recordAsBytes)) {
                    $byteArrayInputStream = 'java::io::ByteArrayInputStream'->new($recordAsBytes);
                    $inputStream = 'java::io::DataInputStream'->new($byteArrayInputStream);
                    try {
                        my $name = $inputStream->readUTF();
                        my $score = $inputStream->readLong();
                        my $newHighScore = 'org::allbinary::game::score::HighScore'->new($id, $name, $org::allbinary::game::GameInfo::NONE, $score);
                        my $list = $self->getList();
                        my $size = $list->size();
                        my $lastIndex = $size;
                        for (my $index = 0; $index < $size; $index++) {
                            my $highScore = $list->{objectArray}->[$index];
                            if ($self->{recordComparatorInterface}->compare($newHighScore->getAsBytes(), $highScore->getAsBytes()) == $javax::microedition::rms::RecordComparator::PRECEDES) {
                                $lastIndex = $index;
                                last;
                            }
                        }
                        $list->addAt($lastIndex, $newHighScore);
                    } catch ($e) {
                        $self->{logUtil}->put("EOF", $self, $self->{commonStrings}->{LOAD}, $e);
                        die $e;
                    }
                }
            }
        } catch ($e) {
            $self->{logUtil}->put("No High Scores", $self, $self->{commonStrings}->{LOAD}, $e);
        } finally {
            try {
                if (defined($recordStore)) {
                    'org::allbinary::logic::communication::log::PreLogUtil'->put("Closing RecordStore", $self, $self->{commonStrings}->{LOAD});
                    $recordStore->closeRecordStore();
                }
            } catch ($e) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{LOAD}, $e);
            }
        }
}


sub isTooManyHighScores {
    my ($self) = @_;
        if (defined($self->getList()) && $self->getList()->size() < $self->{MAXHIGHSCORES}) {
            return 0;
        } else {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("HighScores RecordStore Max Reached: ")->appendint($self->{MAXHIGHSCORES})->toString(), $self, "isTooManyHighScores");
            return 1;
        }
}


# throws Exception
sub isBestScore {
    my ($self, $newHighScore) = @_;
        try {
            if (!$self->isTooManyHighScores()) {
                $self->{logUtil}->putF("Slot Available for a High Score", $self, "isBestScore");
                return 1;
            } else {
                my $list = $self->getList();
                my $size = $list->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $highScore = $list->{objectArray}->[$index];
                    if ($self->{recordComparatorInterface}->compare($newHighScore->getAsBytes(), $highScore->getAsBytes()) == $javax::microedition::rms::RecordComparator::FOLLOWS) {
                        $self->{logUtil}->putF("Obtained a High Score", $self, "isBestScore");
                        return 1;
                    }
                }
            }
            $self->{logUtil}->putF("Not a High Score", $self, "isBestScore");
            return 0;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{ADD}, $e);
            die $e;
        }
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        my $list = $self->getList();
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $highScore = $list->{objectArray}->[$index];
            $stringBuffer->append($highScore->getScoreString());
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{COMMA_SEP});
        }
        return $stringBuffer->toString();
}

# use java::io::ByteArrayInputStream;
# use java::io::DataInputStream;
# use java::io::EOFException;
# use java::io::IOException;
# use javax::microedition::rms::RecordComparator;
# use javax::microedition::rms::RecordEnumeration;
# use javax::microedition::rms::RecordStore;
# use javax::microedition::rms::RecordStoreException;
# use javax::microedition::rms::RecordStoreNotFoundException;
use org::allbinary::TsUtil;
use org::allbinary::game::GameInfo;
use org::allbinary::game::configuration::persistance::NullRecordComparator;
use org::allbinary::game::configuration::persistance::NullRecordFilter;
use org::allbinary::game::configuration::persistance::NullRecordStore;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::persistance::PlatformRecordIdUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::score::HighScores;
use org::allbinary::game::score::HighScore;

1;

