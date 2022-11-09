/**
 * @file main.cpp
 * @author your name (you@domain.com)
 * @brief 
 * @version 0.2
 * @date 2022-11-08
 * 
 * @copyright Copyright (c) 2022
 * 
 */

//open file to read from opencv

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>


int main(int argc, char** argv)
{
    //cam 
    cv::VideoCapture cap(0);
    if(!cap.isOpened())
    {
        std::cout << "Error opening video stream or file" << std::endl;
        return -1;
    }

    while(1)
    {
        cv::Mat frame;
        cap >> frame;
        if(frame.empty())
            break;
        cv::imshow("Frame", frame);
        char c = (char)cv::waitKey(25);
        if(c==27)
            break;
    }
}