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

package org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $uploadMedia = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{readerFileTypesHashMap} = undef;
    $self->{writerFileTypesHashMap} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{readerFileTypesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{writerFileTypesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $hashMap = 'org::allbinary::logic::visual::media::MediaData'->toHashMap();
        my $set = $hashMap->keySet();
        my $mediaDataNameArray = $set->toArray();
        my $size = scalar(@{$mediaDataNameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $mediaDataName = $mediaDataNameArray->[$index];
            my $mediaData = $hashMap->get($mediaDataName);
            $self->{readerFileTypesHashMap}->put($mediaData->getName(), $mediaData->getType());
        }
        my $mediaIOUtil = 'org::allbinary::logic::visual::media::MediaIOUtil'->getInstance();
        my $RESIZABLE_MEDIA = 'org::allbinary::logic::visual::media::MediaTypeData'->getInstance()->{RESIZABLE_MEDIA};
        my $readerFileTypes = $mediaIOUtil->getReaderFormatNames();
        for (my $index = 0; $index < scalar(@{$readerFileTypes}); $index++) {
            $self->{readerFileTypesHashMap}->put($readerFileTypes->[$index], $RESIZABLE_MEDIA);
        }
        my $writerFileTypes = $mediaIOUtil->getWriterFormatNames();
        for (my $index = 0; $index < scalar(@{$writerFileTypes}); $index++) {
            $self->{writerFileTypesHashMap}->put($writerFileTypes->[$index], $RESIZABLE_MEDIA);
        }
        if ($org::allbinary::logic::communication::http::file::upload::media::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::file::upload::media::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Supported Media Readers: ");
            $stringBuffer->append($self->{readerFileTypesHashMap}->toString());
            $stringBuffer->append(" Writers: ");
            $stringBuffer->append($self->{writerFileTypesHashMap}->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if (!defined($org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton::uploadMedia)) {
            $org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton::uploadMedia = 'org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton'->new();
        }
        return $org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton::uploadMedia;
}


sub isReaderSupported {
    my ($self, $mediaFileType) = @_;
        return $self->{readerFileTypesHashMap}->containsKey($mediaFileType);
}


sub isWriterSupported {
    my ($self, $mediaFileType) = @_;
        return $self->{readerFileTypesHashMap}->containsKey($mediaFileType);
}


sub isSupported {
    my ($self, $mediaFileType) = @_;
        return $self->isReaderSupported($mediaFileType) && $self->isWriterSupported($mediaFileType);
}


sub isMedia {
    my ($self, $mediaFileType, $aMediaType) = @_;
        return $self->isReaderMedia($mediaFileType, $aMediaType) && $self->isWriterMedia($mediaFileType, $aMediaType);
}


sub isReaderMedia {
    my ($self, $mediaFileType, $aMediaType) = @_;
        return $self->isMedia($mediaFileType, $aMediaType, $self->{readerFileTypesHashMap});
}


sub isWriterMedia {
    my ($self, $mediaFileType, $aMediaType) = @_;
        return $self->isMedia($mediaFileType, $aMediaType, $self->{writerFileTypesHashMap});
}


# Java overloaded method: Perl keeps the last definition
sub isMedia {
    my ($self, $mediaFileType, $aMediaType, $hashMap) = @_;
        if ($hashMap->containsKey($mediaFileType)) {
            my $mediaType = $hashMap->get($mediaFileType);
            if (($mediaType cmp $aMediaType) == 0) {
                return 1;
            } else {
                return 0;
            }
        } else {
            return 0;
        }
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::media::MediaData;
use org::allbinary::logic::visual::media::MediaIOUtil;
use org::allbinary::logic::visual::media::MediaTypeData;
use org::allbinary::string::CommonStrings;

1;

