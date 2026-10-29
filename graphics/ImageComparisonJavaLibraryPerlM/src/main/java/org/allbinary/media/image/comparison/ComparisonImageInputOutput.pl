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

package org::allbinary::media::image::comparison::ComparisonImageInputOutput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::io::ImageIOInterface';

our $ROOT_NAME = "_Changed_";

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
sub save {
    my ($self, $frame) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        if ($frame > 0) {
            my $imageComparisonResultFrameCacheable = ('org::allbinary::media::image::comparison::ImageComparisonResultCacheSingleton'->getInstance())->get($frame);
            if (defined($imageComparisonResultFrameCacheable)) {
                my $imageComparisonResult = $imageComparisonResultFrameCacheable->getImageComparisonResult();
                $self->save($imageComparisonResult, $imageComparisonResultFrameCacheable->getFrame());
            } else {
                $self->{logUtil}->putF("Comparison Results Not Available for Output: " . $frame, $self, $commonStrings->{SAVE});
            }
        } else {
            $self->{logUtil}->putF("No Comparison Results: for first frame: " . $frame, $self, $commonStrings->{SAVE});
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub save {
    my ($self, $imageComparisonResult, $frame) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $filePathStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer->append($org::allbinary::input::automation::ImageOutputData::SAVE_PATH);
        $filePathStringBuffer->append('org::allbinary::logic::java::number::LongUtil'->fillIn(("" . ($frame))));
        $filePathStringBuffer->append($org::allbinary::media::image::comparison::ComparisonImageInputOutput::ROOT_NAME);
        my $filePathStringBuffer1 = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer1->append($filePathStringBuffer->toString());
        $filePathStringBuffer1->append("_1");
        $filePathStringBuffer1->append('org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}->getExtension());
        my $filePath1 = $filePathStringBuffer1->toString();
        my $filePathStringBuffer2 = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer2->append($filePathStringBuffer->toString());
        $filePathStringBuffer2->append("_2");
        $filePathStringBuffer2->append('org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}->getExtension());
        my $filePath2 = $filePathStringBuffer2->toString();
        my $bufferedImageCacheables = 'org::allbinary::media::image::comparison::ChangedPixelsUtil'->generateBufferedImageChacheables($imageComparisonResult);
        $self->{logUtil}->putF("Comparison Image File Path 1: " . $filePath1, $self, $commonStrings->{SAVE});
        $self->{logUtil}->putF("Comparison Image File Path 2: " . $filePath2, $self, $commonStrings->{SAVE});
        my $bufferedImageArray = [(undef) x (2)];
        $bufferedImageArray->[0] = $bufferedImageCacheables->[0]->getBufferedImage();
        $bufferedImageArray->[1] = $bufferedImageCacheables->[1]->getBufferedImage();
        my $imagePersistanceUtil = 'org::allbinary::media::image::ImagePersistanceUtil'->getInstance();
        $imagePersistanceUtil->saveWithImageIO($filePath1, $bufferedImageArray->[0]);
        $imagePersistanceUtil->saveWithImageIO($filePath2, $bufferedImageArray->[1]);
}

# use java::awt::image::BufferedImage;
use org::allbinary::input::automation::ImageOutputData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::number::LongUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::logic::visual::media::MediaDataFactory;
use org::allbinary::media::image::ImagePersistanceUtil;
use org::allbinary::media::image::cache::BufferedImageCacheable;
use org::allbinary::media::image::io::ImageIOInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::comparison::ImageComparisonResultCacheSingleton;
use org::allbinary::media::image::comparison::ChangedPixelsUtil;

1;

