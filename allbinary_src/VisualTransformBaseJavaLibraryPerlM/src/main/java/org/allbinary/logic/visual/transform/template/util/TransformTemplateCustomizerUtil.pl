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

package org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{CUSTOMIZER_NAME} = undef unless exists $self->{CUSTOMIZER_NAME};
    $self->{BODY_VIEWNAMEKEY} = undef unless exists $self->{BODY_VIEWNAMEKEY};
    $self->{TITLE_VIEWNAMEKEY} = undef unless exists $self->{TITLE_VIEWNAMEKEY};
    $self->{GLOBALS_NEW} = undef unless exists $self->{GLOBALS_NEW};
    $self->{GLOBALS_INSERT} = undef unless exists $self->{GLOBALS_INSERT};
    $self->{GLOBALS_DELETE} = undef unless exists $self->{GLOBALS_DELETE};
    $self->{GLOBALS_EDIT} = undef unless exists $self->{GLOBALS_EDIT};
    $self->{GLOBALS_UPDATE} = undef unless exists $self->{GLOBALS_UPDATE};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $SPACE = 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE};
        $self->{CUSTOMIZER_NAME} = $SPACE . $org::allbinary::logic::visual::transform::info::CustomizerTransformInfoData::NAME;
        $self->{BODY_VIEWNAMEKEY} = $SPACE . 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{VIEWNAMEKEY};
        $self->{TITLE_VIEWNAMEKEY} = $SPACE . 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{VIEWNAMEKEY};
        $self->{GLOBALS_NEW} = $org::allbinary::globals::GLOBALS2::NEW . $SPACE;
        $self->{GLOBALS_INSERT} = $commonStrings->{INSERT} . $SPACE;
        $self->{GLOBALS_DELETE} = $commonStrings->{DELETE} . $SPACE;
        $self->{GLOBALS_EDIT} = $org::allbinary::globals::GLOBALS2::EDIT . $SPACE;
        $self->{GLOBALS_UPDATE} = $commonStrings->{UPDATE} . $SPACE;
    return $self;
}


sub getPageNameHack {
    my ($self, $viewName, $storeName) = @_;
        my $SPACE = 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE};
        my $ONE_EMPTY_STRING_ARRAY = 'org::allbinary::logic::string::StringUtil'->getInstance()->{ONE_EMPTY_STRING_ARRAY};
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put([$viewName . $SPACE], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$storeName . $SPACE], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{CUSTOMIZER_NAME}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{BODY_VIEWNAMEKEY}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{TITLE_VIEWNAMEKEY}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{GLOBALS_NEW}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{GLOBALS_INSERT}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{GLOBALS_DELETE}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{GLOBALS_EDIT}], $ONE_EMPTY_STRING_ARRAY);
        $hashMap->put([$self->{GLOBALS_UPDATE}], $ONE_EMPTY_STRING_ARRAY);
        my $replace = undef;
        my $rootViewName = $replace->all($viewName);
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("RootViewName for ObjectConfig: " . $rootViewName, $self, "getPageNameHack");
        }
        return $rootViewName;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::HashMap ();
use org::allbinary::globals::GLOBALS2 ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::string::regex::replace::Replace ();
use org::allbinary::logic::visual::transform::info::CustomizerTransformInfoData ();
use org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData ();
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData ();
use org::allbinary::string::CommonSeps ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

