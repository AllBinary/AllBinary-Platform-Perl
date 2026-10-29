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

package org::allbinary::logic::visual::transform::info::objectConfig::generator::StoreFileGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGenerator';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{output} = undef;
    $self->{fileAbPath} = undef;
    $self->{file} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $httpTransformInfoInterface = $transformInfoInterface;
        my $weblisketSession = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
        $stringBuffer->append($weblisketSession->getStoreName());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        my $abPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $fileName = $httpTransformInfoInterface->getPropertiesHashMap()->get('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{FILE});
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if ($stringValidationUtil->isEmpty($fileName)) {
            my $transformInfoHttpStoreInterface = $transformInfoInterface;
            $fileName = $transformInfoInterface->getName()->substring($transformInfoHttpStoreInterface->getStoreName()->length() + 1);
            my $outputMappingHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $outputMappingHashMap->put('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{PREVIEW}, "Preview");
            $outputMappingHashMap->put('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{SMALL_PREVIEW}, "SmallPreview");
            $outputMappingHashMap->put('org::allbinary::string::CommonSeps'->getInstance()->{SPACE}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            my $replace = 'org::allbinary::logic::string::regex::replace::Replace'->new($outputMappingHashMap);
            $fileName = $replace->all($fileName);
        }
        if ($stringValidationUtil->isEmpty($fileName)) {
            die ("TransformInfoObjectConfigGenerator FileName Not Specified");
        }
        my $tempOutput = $httpTransformInfoInterface->getPropertiesHashMap()->get('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{NAME});
        if ($stringValidationUtil->isEmpty($tempOutput)) {
            $tempOutput = 'org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{DEFAULT};
        }
        $self->{output} = $tempOutput;
        if ($stringValidationUtil->isEmpty($self->{output})) {
            die ("TransformInfoObjectConfigGenerator Output=extension Not Specified");
        }
        $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($fileName);
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
        $stringBuffer->append($self->{output});
        $abPath = 'org::allbinary::logic::io::path::AbPath'->new($abPath->toString(), $stringBuffer->toString());
        $self->{fileAbPath} = $abPath;
        $self->{file} = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($self->{fileAbPath});
        if ($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("File: " . $self->{fileAbPath}->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws Exception
sub process {
    my ($self, $input) = @_;
        if ($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Processing", $self, $self->{commonStrings}->{PROCESS});
        }
        if (!$self->{file}->exists()) {
            $self->{file}->createNewFile();
        }
        if ($self->{file}->exists()) {
            my $inputStream = 'java::io::ByteArrayInputStream'->new([unpack("C*", $input)]);
            'org::allbinary::logic::io::file::FileUtil'->getInstance()->write($inputStream, $self->{file});
        } else {
            die ("Could Not Create: " . $self->{fileAbPath}->toString());
        }
        if ($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::generator::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Processed", $self, $self->{commonStrings}->{PROCESS});
        }
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

# use java::io::ByteArrayInputStream;
# use java::io::InputStream;
use java::util::HashMap;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::InputOutputTypeData;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfosData;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGenerator;

1;

