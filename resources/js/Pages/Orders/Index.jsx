import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link } from '@inertiajs/react';
import ListOrders from './List';
import { useState } from 'react';

export default function Orders({ auth, orders, success }) {
    const [showBanner, setShowBanner] = useState(success);

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <div className='flex justify-between items-center'>
                    <h2 className="text-xl font-semibold leading-tight text-gray-800">
                        Orders
                    </h2>
                    <Link href={route('orders.create')} className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded'>Create New Order</Link>
                </div>
            }
        >
            <Head title="Orders" />
            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                    {
                        success && showBanner && (
                            <div className='bg-green-500 rounded px-4 py-2 text-white mb-5'>
                                <span className='font-bold text-lg'>Success!</span>
                                <p>{ success }</p>
                                <a href="#" style={{color: 'black'}} onClick={(e)=> setShowBanner(null)}>Dissmiss</a>
                            </div>
                        )
                    }
                    <div className="overflow-hidden bg-white shadow-sm sm:rounded-lg">
                        <ListOrders orders={orders} auth={auth} />
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}