add_executable(
  freeimage_tests
  MainTestSuite.cpp
  testChannels.cpp
  testHeaderOnly.cpp
  testImageType.cpp
  testJPEG.cpp
  testMemIO.cpp
  testMPage.cpp
  testMPageMemory.cpp
  testMPageStream.cpp
  testPlugins.cpp
  TestSuite.h
  testThumbnail.cpp
  testTools.cpp
  testWrappedBuffer.cpp)

target_link_libraries(freeimage_tests freeimage)
